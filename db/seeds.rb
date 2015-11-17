(1..10).each do |index|
  p = Project.create(
    name: "Project #{index}",
    description: "This is project number #{index}"
  )

  (1..3).each do |index2|
  Entry.create(
      project: p,
      hours: index2,
      minutes: 30,
      comment: "This is comment number #{index}",
      date: Time.now
    )
  end
end
