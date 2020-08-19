require 'date'

# make fake exam schedule 
exam_starts = [10, 13, 16, 19]
end_time = Array.new
start_time = Array.new
for i in exam_starts
  start_time.push(i.to_s + ':' + '00')
  end_time.push((i+3).to_s + ':' + '00')
end

times = start_time.zip(end_time)
course_codes = [*200..230].map { |number| "math#{number.to_s}" }
courses = {} 
for course in course_codes
  time = times.sample
  date = DateTime.now + rand(15)
  courses[course] = [date.strftime("%d/%m/%Y"), time[0], time[1]]
end

# add courses to DB
if ENV["exams"]
  for course in courses
    Exam.create(
      course_code: course[0],
      start_time: course[1][1],
      end_time: course[1][2],
      exam_date: course[1][0]
    )
  end
end

# make fake TAs 
tas = Array.new
(1..50).each do |id|
  tas.push([id, id.to_s + '@email.ca'])
end
# add to db
if ENV["users"]
  for ta in tas
    User.create(
      user_id: ta[0],
      email: ta[1],
      password: "password"
    )
  end
end

# make fake owns
tas_owns = Array.new
for ta in tas
  # how many courses a TA has
  ta_load = rand(1..3)
  ta_course_codes = course_codes.sample(ta_load)
  tas_owns.push([ta, ta_course_codes])
end

# add to DB
own_id = 1
if ENV["owns"]
  for ta_own in tas_owns
    for course in ta_own[1]
      course_info = courses[course]
      Own.create(
        own_id: own_id,
        user_id: ta_own[0][0],
        course_code: course,
        event_date: course_info[0],
        start_time: course_info[1],
        end_time: course_info[2]
      )
      own_id += 1
    end
  end
end

# make fake wants 
tas_wants = Array.new
for ta in tas
  # how many courses a TA wants which must be less than/equal to how many
  # they currently have
  tas_course_owns = tas_owns.select { |  x, y  | x == ta }
  tas_course_haves_count = tas_course_owns[0][1].count
  ta_wants_loads = rand(1..tas_course_haves_count)
  # need to find which course the ta has as those cant be what they wwant 
  # get all courses that TA does not have 
  ta_courses_not_tad = course_codes - tas_course_owns[0][1]
  # pick ta_wants_loads number of  random courses
  ta_course_codes = ta_courses_not_tad.sample(ta_wants_loads)
  tas_wants.push([ta, ta_course_codes])
end
# add to DB
wan_id = 1
if ENV["wants"]
  for ta_want in tas_wants
    for course in ta_want[1]
      course_info = courses[course]
      Want.create(
        want_id: wan_id,
        user_id: ta_want[0][0],
        course_code: course,
        event_date: course_info[0],
        start_time: course_info[1],
        end_time: course_info[2]
      )
      wan_id += 1
    end
  end
end


