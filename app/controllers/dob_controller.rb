class DobController < ApplicationController
  def index
    @dob=params[:dob]
    dob_date=Date.parse(@dob)
    current_date=Date.today
    current_time=Time.now

    age_seconds = current_time - Time.new(dob_date.year, dob_date.month, dob_date.day)
  
    age_years = age_seconds / (60 * 60 * 24 * 365.25)
    age_months = (age_years % 1) * 12
    age_days = ((age_months % 1) * (365.25 / 12))
    age_hours = ((age_days % 1) * 24)
    age_minutes = ((age_hours % 1) * 60)
    age_seconds = ((age_minutes % 1) * 60)

    # Return the calculated age components
    render json: {
      years: age_years.to_i,
      months: age_months.to_i,
      days: age_days.to_i,
      hours: age_hours.to_i,
      minutes: age_minutes.to_i,
      seconds: age_seconds.to_i,
    }

  end

end
