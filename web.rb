require 'sinatra'
require_relative 'worker'

get "/task/:task" do |task|
    case task
    when "super_hard"
        OurWorker.perform_async("super_hard")
    when "hard"
        OurWorker.perform_async("hard")
    else
        OurWorker.perform_async(task)
    end
end

get "/task/:task/schedule/:schedule" do |task, schedule|
    case task
    when "super_hard"
        OurWorker.perform_in(schedule.to_i, "super_hard")
    when "hard"
        OurWorker.perform_in(schedule.to_i, "hard")
    else
        OurWorker.perform_in(schedule.to_i, task)
    end
end