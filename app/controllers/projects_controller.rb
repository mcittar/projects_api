class ProjectsController < ApplicationController

  def show
    p Project.search(params)
  end

  def create
    @params = parsed_params
    @project = Project.new(@params.except(
      :expiry_date,
      :creation_date,
      :target_countries,
      :target_keys
    ))

    parse_and_add_date_text
    check_target_data
    if @project.save

    else
      @project.errors.full_messages
    end

  end

  private

  def project_params
    param.require(:project)
      .permit(:id, :projectName, :creationDate, :expiryDate,
              :enabled, :projectCost, :projectUrl,
              targetCountries: [], targetKeys: [:number, :keyword])
  end

  # It is Ruby convention to name things in snake_case, this function maps
  # the cameCase input into snake_case to comply with that convention.
  def parsed_params
    keys = project_params[:targetKeys].map do |key|
      { number: key[:number], keyword: key[:keyword] }
    end

    {
      id: project_params[:id],
      project_name: project_params[:projectName],
      creation_date: project_params[:creationDate],
      expiry_date: project_params[:expiryDate],
      enabled: project_params[:enabled],
      target_countries: project_params[:targetCountries],
      project_cost: project_params[:projectCost],
      project_url: project_params[:projectUrl],
      target_keys: keys
    }
  end

  def parse_and_add_date_text
    @project.creation_date = Date.strptime(
      @params[:creation_date], "%m%d%Y %H:%M:%S"
    )
    @project.expiry_date = Date.strptime(
      @params[:expiry_date], "%m%d%Y %H:%M:%S"
    )
  end

  def check_target_data
    @params[:target_countries].each { |country| Country.create(name: country) }
    countries = Country.where(name: @params[:target_countries])
    countries.each do |country|
      @project.countries << country
    end

    @params[:target_keys].each do |key|
      test_key = Key.create(number: key[:number], keyword: key[:keyword])

      if duplicate_key?(test_key)
        test_key = Key.where(
          number: test_key[:number],
          keyword: test_key[:keyword]
        )
        @project.keys << test_key
      else
        test_key.errors.full_messages.each do |error|
          @project.errors[:base] << error
        end
      end
    end

  end

  def duplicate_key?(test_key)
    db_key = Key.where(
      number: test_key[:number],
      keyword: test_key[:keyword]
    ).first

    db_key[:number] == test_key[:number] &&
    db_key[:keyword] == test_key[:keyword]
  end

end
