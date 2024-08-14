# Clients
Client.create(name: "Amazon")
Client.create(name: "Apple")

# Supporter Employees
SupporterEmployee.create(name: "David", assigned_color: "Blue")
SupporterEmployee.create(name: "Daniel", assigned_color: "Red")
SupporterEmployee.create(name: "Estefany", assigned_color: "Green")
SupporterEmployee.create(name: "Andrea", assigned_color: "Yellow")

# Client Schedules
# Week 1
# Monday
ClientSchedule.create!(client_id: Client.find(1).id,start_hour: "2024-07-15 08:00:00",end_hour: "2024-07-15 18:00:00",day_of_week: 'monday')
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.find(1).id,supporter_employee_id: SupporterEmployee.first.id,time: "2024-07-15 9:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-15 10:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-15 11:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 12:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 13:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 14:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-15 15:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.first.id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-15 16:00:00",confirmed_time: true)



# Tuesday
ClientSchedule.create!(client_id: Client.first.id,start_hour: "2024-07-16 07:00:00",end_hour: "2024-07-16 16:00:00",day_of_week: 'tuesday')
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.second.id,supporter_employee_id: SupporterEmployee.first.id,time: "2024-07-16 10:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.second.id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-16 11:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.second.id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-16 12:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.second.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-16 16:00:00",confirmed_time: true)


# Thursday
ClientSchedule.create!(client_id: Client.first.id,start_hour: "2024-07-18 07:00:00",end_hour: "2024-07-18 16:00:00",day_of_week: 'thursday')
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.third.id,supporter_employee_id: SupporterEmployee.first.id,time: "2024-07-18 13:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.third.id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-18 12:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.third.id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-18 15:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.third.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-18 15:00:00",confirmed_time: true)


# Friday
ClientSchedule.create!(client_id: Client.first.id,start_hour: "2024-07-19 09:00:00",end_hour: "2024-07-19 18:00:00",day_of_week: 'friday')
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.fourth.id,supporter_employee_id: SupporterEmployee.first.id,time: "2024-07-19 12:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.fourth.id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-19 14:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.fourth.id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-19 16:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(1).id, client_schedule_id: ClientSchedule.fourth.id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-19 18:00:00",confirmed_time: true)

# Client 2
# Week 1
# Wednesday
ClientSchedule.create!(client_id: Client.second.id,start_hour: "2024-07-15 08:00:00",end_hour: "2024-07-15 18:00:00",day_of_week: 'wednesday')
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.first.id,time: "2024-07-15 9:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-15 10:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-15 11:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 12:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 13:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.fourth.id,time: "2024-07-15 14:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.third.id,time: "2024-07-15 15:00:00",confirmed_time: true)
ScheduleAssignment.create!(client_id: Client.find(2).id, client_schedule_id: ClientSchedule.find(5).id,supporter_employee_id: SupporterEmployee.second.id,time: "2024-07-15 16:00:00",confirmed_time: true)
