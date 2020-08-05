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

# make fake TAs 
tas = Array.new
(1..50).each do |id|
  tas.push([id, id.to_s + '@email.ca'])
end
# add to db
for ta in tas
  User.create(
    user_id: ta[0],
    email: ta[1],
    password: "password"
  )
end

# make fake haves
tas_haves = Array.new
for ta in tas
  # how many courses a TA has
  ta_load = rand(1..3)
  ta_course_codes = course_codes.sample(ta_load)
  tas_haves.push([ta, ta_course_codes])
end

# add to DB
has_id = 1
for ta_has in tas_haves
  for course in ta_has[1]
    course_info = courses[course]
    Have.create(
      have_id: has_id,
      user_id: ta_has[0][0],
      course_code: course,
      event_date: course_info[0],
      start_time: course_info[1],
      end_time: course_info[2]
    )
    has_id += 1
  end
end

# make fake wants 
tas_wants = Array.new
for ta in tas
  # how many courses a TA wants which must be less than/equal to how many
  # they currently have
  tas_course_haves = tas_haves.select { |  x, y  | x == ta }
  tas_course_haves_count = tas_course_haves[0][1].count
  ta_wants_loads = rand(1..tas_course_haves_count)
  # need to find which course the ta has as those cant be what they wwant 
  # get all courses that TA does not have 
  ta_courses_not_tad = course_codes - tas_course_haves[0][1]
  # pick ta_wants_loads number of  random courses
  ta_course_codes = ta_courses_not_tad.sample(ta_wants_loads)
  tas_wants.push([ta, ta_course_codes])
end
# add to DB
wan_id = 1
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
