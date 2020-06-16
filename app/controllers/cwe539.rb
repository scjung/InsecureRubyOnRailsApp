# frozen_string_literal: true

# CWE-539
module Cwe539
  def edit_cwe539
    cookies.permanent[:cwe539_perm] = 'permanent'
    cookies[:cwe539_one_week] = { value: '1 week', expires: 1.week.from_now.utc }
    cookies[:cwe539_one_day] = { value: '1 day', expires: 1.day.from_now.utc }
    cookies[:cwe539_one_hour] = { value: '1 hour', expires: 1.hour.from_now.utc }
    cookies[:cwe539_ten_min] = { value: '10 min.', expires: 10.minutes.from_now.utc }
    cookies[:cwe539_session] = 'session'
    render :cwe539
  end

  def update_cwe539
    redirect_to edit_attack_path(539)
  end
end
