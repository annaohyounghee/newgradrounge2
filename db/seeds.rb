# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!([
	{
		email: 'nizar.triki@mcgill.ca',
		password: 'password',
		position: 'Undergraduate student'		
	},
	{
		email: 'george.fortin@mcgill.ca',
		password: 'password',
		position: 'Reasearch Assistant'
	},
	{
		email: 'pascal.kropf@mcgill.ca',
		password: 'password',
		position: 'Postdoctoral fellow'
	},
	{
		email: 'sean.reed@mcgill.ca',
		password: 'password',
		position: 'Teaching Assistant'
	}

])

Event.create!([
	{
		e_title: '1 this is test1',
		e_detail: '1 detail',
		e_interest: '1 interest'		
	},
	{
		e_title: '1 this is test1',
		e_detail: '1 detail',
		e_interest: '1 interest'
	},
	{
		e_title: '1 this is test1',
		e_detail: '1 detail',
		e_interest: '1 interest'
	},
	{
		e_title: '1 this is test1',
		e_detail: '1 detail',
		e_interest: '1 interest'
	}

])

Profile.create!([
	{
		user_id: '1'
	},
	{
		user_id: '2'
	},
	{
		user_id: '3'
	},
	{
		user_id: '4'
	}

])

Award.create!([
	{
		profile_id: '1',
		title: 'Early adopter',
		image: 'http://res.cloudinary.com/darri/image/upload/v1517261007/medal_bronze_32_ofplbx.png'
	},
	{
		profile_id: '2',
		title: 'Early adopter',
		image: 'http://res.cloudinary.com/darri/image/upload/v1517261007/medal_bronze_32_ofplbx.png'
	},
	{
		profile_id: '3',
		title: 'Early adopter',
		image: 'http://res.cloudinary.com/darri/image/upload/v1517261007/medal_bronze_32_ofplbx.png'
	},
	{
		profile_id: '4',
		title: 'Early adopter',
		image: 'http://res.cloudinary.com/darri/image/upload/v1517261007/medal_bronze_32_ofplbx.png'
	}

])

Research.create!([
	{
		description: 'Proposing and testing new methods and algorithms for mapping virtual networks that can effectively use resources provided by a physical infrastructure, Computer Systems Architecture Labs.',
		profile_id: '1'
			
	},
	{
		description: Faker::Lorem.sentence,
		profile_id: '2'
	
	},
	{
		description: Faker::Lorem.sentence,
		profile_id: '3'
	},
	{
		description: 'My doctoral work evaluates decision making through delineating glutamatergic projections into the nucleus accumbens using a variety of novel imaging and optogenetic strategies. ',
		profile_id: '4'
	}

])

Education.create!([
	{
		school: 'École de technologie supérieure',
		degree: 'MSc in Engineering',
		field_of_study: 'Telecommunications Networks',
		grade: 'Student Researcher',
		from_date: '2010',
		to_date: '2012',
		description: 'Proposing and testing new methods and algorithms for mapping virtual networks that can effectively use resources provided by a physical infrastructure, Computer Systems Architecture Labs.',
		profile_id: '1'
			
	},
	{
		school: 'HEIG-VD',
		degree: 'Degree in Telecommunications',
		field_of_study: 'Networking and Information Technology',
		grade: 'Tester',
		from_date: '2005',
		to_date: '2009',
		description: 'Designing and building a virtual VoIP infrastructure using ESX Server and Cisco Unified Communications manager (CUCM), Institute for Information and Communication.',
		profile_id: '1'
			
	},
	{
		school: 'Rotman School of Management',
		degree: 'MBA',
		field_of_study: 'Finance',
		from_date: '2013',
		to_date: '2015',
		profile_id: '2'
			
	},
	{
		school: 'York University',
		degree: 'Bachelor',
		field_of_study: 'Business Economics',
		from_date: '2004',
		to_date: '2008',
		profile_id: '2'
			
	},
	{
		school: 'McGill University',
		degree: 'PHD',
		field_of_study: 'Neuroscience',
		grade: 'Student Researcher',
		from_date: '2012',
		to_date: '2017',
		description: 'My doctoral work evaluates decision making through delineating glutamatergic projections into the nucleus accumbens using a variety of novel imaging and optogenetic strategies. ',
		profile_id: '4'
			
	},
	{
		school: 'McGill University',
		degree: 'PHD',
		field_of_study: 'Neuroscience',
		grade: 'Student Researcher',
		from_date: '2012',
		to_date: '2017',
		description: 'My doctoral work evaluates decision making through delineating glutamatergic projections into the nucleus accumbens using a variety of novel imaging and optogenetic strategies. ',
		profile_id: '3'
			
	},
	{
		school: 'McGill University',
		degree: "Master's Degree",
		field_of_study: 'Neuroscience',
		from_date: '2008',
		to_date: '2012',
		description: 'Differential effects of Propofol on gamma-band activity across cortical and thalamic sites in the rat, in vivo. ',
		profile_id: '4'
			
	}
])

Experience.create!([
	{
		title: 'Senior Real Estate Analyst',
		company: 'PSP Investments',
		location: 'Montreal',
		from_date: '2015-11-11',
		to_date: '2017-11-11',
		profile_id: '2'
			
	},
	{
		title: 'Senior Financial Analyst M&A',
		company: 'Premier Tech',
		location: 'Montreal',
		from_date: '2009-11-11',
		to_date: '2013-11-11',
		profile_id: '2'
			
	},
	{
		title: 'Cyber Security Analyst',
		company: 'Bell Canada',
		location: 'Montreal',
		description: 'Present, integrate and configure a wide range of network management and security solutions (Sourcefire IPS, PaloAlto NG Firewall, Cisco Meraki AP, etc.) ',
		from_date: '2016-11-11',
		to_date: '2017-11-11',
		profile_id: '1'
			
	},
	{
		title: 'Network Security Analyst',
		company: 'Altea Communications',
		location: 'Montreal',
		description: 'Present, integrate and configure a wide range of network management and security solutions (Sourcefire IPS, PaloAlto NG Firewall, Cisco Meraki AP, etc.) ',
		from_date: '2012-11-11',
		to_date: '2016-11-11',
		profile_id: '1'
			
	},
	{
		title: 'Researcher',
		company: 'Mcgill',
		location: 'Montreal',
		description: Faker::Lorem.sentence,
		from_date: '2016-11-11',
		to_date: '2017-11-11',
		profile_id: '3'
			
	},
	{
		title: 'Researcher',
		company: 'Mcgill',
		location: 'Montreal',
		description: Faker::Lorem.sentence,
		from_date: '2016-11-11',
		to_date: '2017-11-11',
		profile_id: '4'
			
	}
])

reachout_type_list = ['group meeting','Journal club','Short-term collaboration','Long-term collaboration','Leisure meetup','Undergraduate project','Equipment search']
audience_list= ['doctoral students','Undergraduate student','Masters s student','Reasearch Assistant','Teaching Assistant','Postdoctoral fellow','Lecturer,Professor']
interest_list = ['Aerospace Engineering', 'Bioresource Engineering', 'Chemical Engineering', 'Civil Engineering', 'Computer Engineering', 'Electrical Engineering', 'Materials Engineering', 'Mining Engineering', 'Software Engineering', 'Urban Planning']

20.times do 
	Reachout.create!(
		title: Faker::Lorem.sentence,
		description: Faker::Lorem.sentence,
		back_story: Faker::Lorem.sentence,
		format: Faker::Lorem.sentence,
		reachout_type: reachout_type_list.sample,
		audience: audience_list[1..2],
		tag_list: Faker::Job.key_skill,
		duration: '2 hours',
		interest: interest_list[1..2],
		reachout_when: '2018-04-02',
		reachout_where: 'McGill University Library',
		compensation: 'biers',
		user_id: 1 + rand(4)
	)
end