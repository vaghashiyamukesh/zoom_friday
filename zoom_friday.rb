# New Hires
# When someone (like you!) joins the company, we want to add them to the list of people
# going to lunch.
# Persistence
# With over 100 employees, adding everyone from scratch is not sustainable. Once
# someone has been added, they should remain in the list across restarts.
# Lunchtime

# On Zoom Friday, we want to assign everyone randomly into lunch groups. Each groups
# should be between 3-5 people.

class Employee
  attr_accessor :name, :is_member
  def initialize(name, is_member)
    @name = name
    @is_member = is_member
  end
end
class Employer
  attr_accessor :employee_list
  def initialize
    @employee_list = []
  end

  def add_employee(name, is_member = false)
    employee = Employee.new(name, is_member)
    @employee_list.push(employee)
  end

  def member_list
    @employee_list.map do |employee|
      employee if employee.is_member
    end
  end

  def friday_lunch_group
    names = member_list
    no_of_groups = names.size/3
    left = names.size%3
    names = names.shuffle! 
    lunch_groups = [] * no_of_groups
    start = 0
    no_of_groups.times do |i|
      length = no_of_groups + (left > 0 ? 1 : 0)
      left -= 1 if left > 0
      lunch_groups.push(names[start...(start+length)])
      start += length
    end
    lunch_groups.each_with_index do |group,index|
      p "------------------------"
      p "Lunch group #{index + 1}"
      p "------------------------"
      group.each do |member|
        p member.name
      end
    end
  end
end


employer = Employer.new
employer.add_employee('Sander', true)
employer.add_employee('Sjaak', true)
employer.add_employee('Timo',true)
employer.add_employee('Ernst',true)
employer.add_employee('Floris',true)
employer.add_employee('Wayne', true)
employer.add_employee('Arno',true)
employer.add_employee('Henk', true)
employer.add_employee('Rob', true)
employer.add_employee('Mukesh', true)
employer.friday_lunch_group
