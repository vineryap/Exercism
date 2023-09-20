defmodule FreelancerRates do
  @daily_working_hours 8
  @monthly_billable_days 22

  def daily_rate(hourly_rate), do: @daily_working_hours * hourly_rate + 0.0

  def apply_discount(before_discount, discount), do: before_discount * (1.0 - discount / 100)

  def monthly_rate(hourly_rate, discount),
    do: ceil(@monthly_billable_days * apply_discount(daily_rate(hourly_rate), discount))

  def days_in_budget(budget, hourly_rate, discount),
    do: Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1) + 0.0
end
