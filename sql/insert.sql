-- Users data insertion
INSERT INTO "users" (id, username, firstName, lastName, email, password, bio, "createdAt", "updatedAt")
VALUES
  ('147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'rahmed', 'Rahim', 'Ahmed', 'rahim@gmail.com', 'password123', 'Web Developer', '2023-01-01 12:00:00', '2023-01-01 12:00:00'),
  ('c6e8a09d-1510-47fc-ab28-84998f779cc0', 'akhan', 'Aisha', 'Khan', 'aisha@yahoo.com', 'securepass456', 'Graphic Designer', '2023-01-02 14:30:00', '2023-01-02 14:30:00'),
  ('1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'shossain', 'Siam', 'Hossain', 'siam@hotmail.com', 'pass321', 'Data Analyst', '2023-01-03 16:45:00', '2023-01-03 16:45:00'),
  ('d39c7266-6d9e-492e-adff-13411face70b', 'nislam', 'Nadia', 'Islam', 'nadia@gmail.com', 'secretword789', 'UX Designer', '2023-01-04 18:20:00', '2023-01-04 18:20:00'),
  ('a0df4b55-ebc9-4354-ba64-67607ca936ad', 'frahman', 'Farhan', 'Rahman', 'farhan@yahoo.com', 'passphrase987', 'Software Engineer', '2023-01-05 21:10:00', '2023-01-05 21:10:00'),
  ('698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'sali', 'Sara', 'Ali', 'sara@hotmail.com', 'mysecurepass', 'Marketing Specialist', '2023-01-06 09:15:00', '2023-01-06 09:15:00'),
  ('1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'kakter', 'Kamal', 'Akter', 'kamal@gmail.com', 'strongpass555', 'SEO Analyst', '2023-01-07 11:30:00', '2023-01-07 11:30:00'),
  ('b8e741b0-21bd-447f-8039-fdf9a04724f9', 'rchowdhury', 'Rima', 'Chowdhury', 'rima@yahoo.com', 'mypassword123', 'Content Writer', '2023-01-08 13:40:00', '2023-01-08 13:40:00'),
  ('79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'isiddique', 'Imran', 'Siddique', 'imran@hotmail.com', 'secure123pass', 'Financial Analyst', '2023-01-09 15:55:00', '2023-01-09 15:55:00'),
  ('b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'trahman', 'Tania', 'Rahman', 'tania@gmail.com', 'taniapass', 'HR Manager', '2023-01-10 17:10:00', '2023-01-10 17:10:00');


-- Tweets data insertion
INSERT INTO "tweets" (id, "userId", content, "createdAt", "updatedAt")
VALUES
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d01', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'Just had a delicious meal at a local restaurant in Dhaka! #Foodie', '2023-01-15 08:30:00', '2023-01-15 08:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d02', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'Enjoying the beautiful sunset at Cox’s Bazar. 🌅 #NatureLover', '2023-01-16 10:45:00', '2023-01-16 10:45:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d03', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'Coding all night to meet project deadlines. 💻 #DeveloperLife', '2023-01-17 12:20:00', '2023-01-17 12:20:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d04', 'd39c7266-6d9e-492e-adff-13411face70b', 'Visited the historic Lalbagh Fort today. Such a fascinating place! #History', '2023-01-18 14:00:00', '2023-01-18 14:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d05', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'Excited about the upcoming cricket match between Bangladesh and India! 🏏 #Cricket', '2023-01-19 16:30:00', '2023-01-19 16:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d06', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'Working on a new design project. Can’t wait to see the final result! #Design', '2023-01-20 18:15:00', '2023-01-20 18:15:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d07', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'Good morning, Dhaka! ☀️ Starting the day with a cup of tea. #MorningVibes', '2023-01-21 09:00:00', '2023-01-21 09:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d08', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'Writing a new blog post about technology trends in Bangladesh. Stay tuned! #Tech', '2023-01-22 11:45:00', '2023-01-22 11:45:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d09', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'Analyzing financial data for the quarter. Numbers, numbers, and more numbers! #Finance', '2023-01-23 13:30:00', '2023-01-23 13:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d10', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'HR workshop today. Learning about effective employee management. #HR', '2023-01-24 15:15:00', '2023-01-24 15:15:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d11', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'Exploring the vibrant street markets in Old Dhaka. So many colors and flavors! #Travel', '2023-01-25 17:00:00', '2023-01-25 17:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d12', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'Attended an art exhibition showcasing local talent. Amazing creativity on display! #Art', '2023-01-26 19:00:00', '2023-01-26 19:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d13', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'Late-night coding session. The deadline is approaching! 💻 #Developer', '2023-01-27 21:30:00', '2023-01-27 21:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d14', 'd39c7266-6d9e-492e-adff-13411face70b', 'Enjoying a quiet evening by the Buriganga River. #Relaxation', '2023-01-28 23:15:00', '2023-01-28 23:15:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d15', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'Excited to announce the launch of our new project! 🚀 #Achievement', '2023-01-29 08:45:00', '2023-01-29 08:45:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d16', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'Preparing for an upcoming marketing campaign. #MarketingStrategy', '2023-01-30 10:30:00', '2023-01-30 10:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d17', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'Optimizing website content for better SEO. #SEO', '2023-01-31 12:15:00', '2023-01-31 12:15:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d18', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'Attending a seminar on the latest technological advancements. #TechTalk', '2023-02-01 14:00:00', '2023-02-01 14:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d19', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'Analyzing market trends to make informed financial decisions. #Finance', '2023-02-02 16:00:00', '2023-02-02 16:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d20', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'Recruitment process underway. Excited to welcome new team members! #HR', '2023-02-03 18:00:00', '2023-02-03 18:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d21', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'Trying out the local street food. Dhaka’s food scene never disappoints! #FoodAdventure', '2023-02-04 20:00:00', '2023-02-04 20:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d22', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'Attended a photography workshop. Learning new skills to capture beautiful moments! #Photography', '2023-02-05 22:00:00', '2023-02-05 22:00:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d23', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'Late-night data analysis. Crunching numbers for actionable insights. #DataAnalysis', '2023-02-06 09:30:00', '2023-02-06 09:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d24', 'd39c7266-6d9e-492e-adff-13411face70b', 'Exploring the Sundarbans, home to the Bengal tiger. #AdventureTime', '2023-02-07 11:30:00', '2023-02-07 11:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d25', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'Cricket match was intense! What a nail-biter. Well played, Bangladesh! 🇧🇩 #CricketFever', '2023-02-08 13:30:00', '2023-02-08 13:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d26', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'Launching a new marketing campaign. Excited to see the audience response! #Marketing', '2023-02-09 15:30:00', '2023-02-09 15:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d27', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'Improving website rankings with effective SEO strategies. #SEOExpert', '2023-02-10 17:30:00', '2023-02-10 17:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d28', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'Latest tech trends: AI and machine learning. Exciting times ahead! #TechTrends', '2023-02-11 19:30:00', '2023-02-11 19:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d29', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'Reviewing financial reports for the month. Numbers tell a story. #Finance', '2023-02-12 21:30:00', '2023-02-12 21:30:00'),
  ('d7a15a18-0cf2-4c8d-a481-0d7c97210d30', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'Attending a workshop on effective employee management. #HR', '2023-02-13 23:30:00', '2023-02-13 23:30:00');

-- Retweets data insertion
INSERT INTO "retweets" (id, "userId", "tweetId", "createdAt", "updatedAt")
VALUES
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38101', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', '2023-02-01 08:45:00', '2023-02-01 08:45:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38102', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d02', '2023-02-02 10:30:00', '2023-02-02 10:30:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38103', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d03', '2023-02-03 12:50:00', '2023-02-03 12:50:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38104', 'd39c7266-6d9e-492e-adff-13411face70b', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d04', '2023-02-04 15:15:00', '2023-02-04 15:15:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38105', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d05', '2023-02-05 18:05:00', '2023-02-05 18:05:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38106', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d06', '2023-02-06 20:20:00', '2023-02-06 20:20:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38107', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d07', '2023-02-07 09:35:00', '2023-02-07 09:35:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38108', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d08', '2023-02-08 11:45:00', '2023-02-08 11:45:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38109', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d09', '2023-02-09 14:00:00', '2023-02-09 14:00:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38110', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d10', '2023-02-10 16:15:00', '2023-02-10 16:15:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38111', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d11', '2023-02-11 17:30:00', '2023-02-11 17:30:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38112', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d12', '2023-02-12 19:45:00', '2023-02-12 19:45:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38113', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d13', '2023-02-13 10:00:00', '2023-02-13 10:00:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38114', 'd39c7266-6d9e-492e-adff-13411face70b', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d14', '2023-02-14 12:15:00', '2023-02-14 12:15:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38115', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', '2023-02-15 15:25:00', '2023-02-15 15:25:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38116', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d02', '2023-02-16 17:40:00', '2023-02-16 17:40:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38117', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d03', '2023-02-17 09:55:00', '2023-02-17 09:55:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38118', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d04', '2023-02-18 11:10:00', '2023-02-18 11:10:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38119', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d05', '2023-02-19 13:25:00', '2023-02-19 13:25:00'),
  ('7e4a1f2d-0878-4ba1-90c7-d8a5f2b38120', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d06', '2023-02-20 15:40:00', '2023-02-20 15:40:00');


-- Comments data insertion
-- Comments for Tweet 1
INSERT INTO "comments" (id, "userId", "tweetId", content, "createdAt", "updatedAt")
VALUES
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b501', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'Great weather!', '2023-03-01 08:50:00', '2023-03-01 08:50:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b502', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'Lovely day in Dhaka!', '2023-03-01 09:15:00', '2023-03-01 09:15:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b503', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'Wish I could be there!', '2023-03-01 10:00:00', '2023-03-01 10:00:00');

-- Replies to Comment 1
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e32f4a5b601', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b501', 'd39c7266-6d9e-492e-adff-13411face70b', 'Yes, the weather is amazing!', '2023-03-01 10:30:00', '2023-03-01 10:30:00');

-- Replies to Comment 2
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e32f4a5b602', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b502', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'I agree, it''s a beautiful day!', '2023-03-01 11:00:00', '2023-03-01 11:00:00');

-- Replies to Comment 3
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e32f4a5b603', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f32a4b503', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'Wish you were here too!', '2023-03-01 11:30:00', '2023-03-01 11:30:00');


-- Comments for Retweet 1
INSERT INTO "comments" (id, "userId", "retweetId", content, "createdAt", "updatedAt")
VALUES
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b701', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'This tweet is spot on!', '2023-03-02 08:55:00', '2023-03-02 08:55:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b702', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'Couldn''t agree more!', '2023-03-02 09:20:00', '2023-03-02 09:20:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b703', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01', 'Retweeted for emphasis!', '2023-03-02 10:05:00', '2023-03-02 10:05:00');

-- Replies to Comment 4
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a62b7c801', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b701', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'Absolutely!', '2023-03-02 10:30:00', '2023-03-02 10:30:00');

-- Replies to Comment 5
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a62b7c802', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b702', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'Thanks for the retweet!', '2023-03-02 11:00:00', '2023-03-02 11:00:00');

-- Replies to Comment 6
INSERT INTO "comments" (id, "commentId", "userId", content, "createdAt", "updatedAt")
VALUES
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a62b7c803', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b703', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'Glad you agree!', '2023-03-02 11:30:00', '2023-03-02 11:30:00');


-- Likes data insertion
-- Likes for Tweet 1
INSERT INTO "likes" (id, "userId", "tweetId")
VALUES
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a01', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a02', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a03', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'd7a15a18-0cf2-4c8d-a481-0d7c97210d01');

-- Likes for Retweet 1
INSERT INTO "likes" (id, "userId", "retweetId")
VALUES
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a04', 'd39c7266-6d9e-492e-adff-13411face70b', '7e4a1f2d-0878-4ba1-90c7-d8a5f2b38101'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a05', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', '7e4a1f2d-0878-4ba1-90c7-d8a5f2b38101'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a06', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', '7e4a1f2d-0878-4ba1-90c7-d8a5f2b38101');

-- Likes for Comment 1
INSERT INTO "likes" (id, "userId", "commentId")
VALUES
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a07', '1ae6cb06-e111-4cc0-b4f9-16e789e0e83b', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b701'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a08', 'b8e741b0-21bd-447f-8039-fdf9a04724f9', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b701'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a09', '79e97ede-f227-4cd4-a8ad-4c18fdde417f', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b701');

-- Likes for Comment 2
INSERT INTO "likes" (id, "userId", "commentId")
VALUES
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a10', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b702'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a11', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b702'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a12', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b702');

-- Likes for Comment 3
INSERT INTO "likes" (id, "userId", "commentId")
VALUES
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a13', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b703'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a14', 'd39c7266-6d9e-492e-adff-13411face70b', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b703'),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5a15', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', '3a4b5c6d-7e8f-9a0b-1c2d-3e4f52a6b703');

-- Followers data insertion
-- User 1 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5b01', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', TRUE, '2023-04-01 08:45:00', '2023-04-01 08:45:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5b02', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', FALSE, '2023-04-01 09:00:00', '2023-04-01 09:00:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5b03', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd39c7266-6d9e-492e-adff-13411face70b', TRUE, '2023-04-01 09:15:00', '2023-04-01 09:15:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5b04', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', FALSE, '2023-04-01 09:30:00', '2023-04-01 09:30:00'),
  ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5b05', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', TRUE, '2023-04-01 09:45:00', '2023-04-01 09:45:00');

-- User 2 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6b01', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 10:00:00', '2023-04-01 10:00:00'),
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6b02', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', FALSE, '2023-04-01 10:15:00', '2023-04-01 10:15:00'),
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6b03', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd39c7266-6d9e-492e-adff-13411face70b', TRUE, '2023-04-01 10:30:00', '2023-04-01 10:30:00'),
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6b04', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', FALSE, '2023-04-01 10:45:00', '2023-04-01 10:45:00'),
  ('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6b05', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', TRUE, '2023-04-01 11:00:00', '2023-04-01 11:00:00');

-- User 3 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7b01', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 11:15:00', '2023-04-01 11:15:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7b02', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', FALSE, '2023-04-01 11:30:00', '2023-04-01 11:30:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7b03', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'd39c7266-6d9e-492e-adff-13411face70b', TRUE, '2023-04-01 11:45:00', '2023-04-01 11:45:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7b04', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', FALSE, '2023-04-01 12:00:00', '2023-04-01 12:00:00'),
  ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7b05', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', TRUE, '2023-04-01 12:15:00', '2023-04-01 12:15:00');

-- User 4 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8b01', 'd39c7266-6d9e-492e-adff-13411face70b', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 12:30:00', '2023-04-01 12:30:00'),
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8b02', 'd39c7266-6d9e-492e-adff-13411face70b', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', FALSE, '2023-04-01 12:45:00', '2023-04-01 12:45:00'),
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8b03', 'd39c7266-6d9e-492e-adff-13411face70b', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 13:00:00', '2023-04-01 13:00:00'),
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8b04', 'd39c7266-6d9e-492e-adff-13411face70b', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', FALSE, '2023-04-01 13:15:00', '2023-04-01 13:15:00'),
  ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8b05', 'd39c7266-6d9e-492e-adff-13411face70b', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', TRUE, '2023-04-01 13:30:00', '2023-04-01 13:30:00');

-- User 5 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9b01', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 13:45:00', '2023-04-01 13:45:00'),
  ('5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9b02', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', FALSE, '2023-04-01 14:00:00', '2023-04-01 14:00:00'),
  ('5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9b03', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 14:15:00', '2023-04-01 14:15:00'),
  ('5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9b04', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', 'd39c7266-6d9e-492e-adff-13411face70b', FALSE, '2023-04-01 14:30:00', '2023-04-01 14:30:00'),
  ('5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9b05', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', TRUE, '2023-04-01 14:45:00', '2023-04-01 14:45:00');

-- User 6 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('6c7d8e9f-0a1b-2c3d-4e5f-6a7b8c9d0b01', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 15:00:00', '2023-04-01 15:00:00'),
  ('6c7d8e9f-0a1b-2c3d-4e5f-6a7b8c9d0b02', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', FALSE, '2023-04-01 15:15:00', '2023-04-01 15:15:00'),
  ('6c7d8e9f-0a1b-2c3d-4e5f-6a7b8c9d0b03', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 15:30:00', '2023-04-01 15:30:00'),
  ('6c7d8e9f-0a1b-2c3d-4e5f-6a7b8c9d0b04', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'd39c7266-6d9e-492e-adff-13411face70b', FALSE, '2023-04-01 15:45:00', '2023-04-01 15:45:00'),
  ('6c7d8e9f-0a1b-2c3d-4e5f-6a7b8c9d0b05', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', TRUE, '2023-04-01 16:00:00', '2023-04-01 16:00:00');

-- User 7 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('7d8e9f0a-1b2c-3d4e-5f6a-7b8c9d0e1b01', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', TRUE, '2023-04-01 16:15:00', '2023-04-01 16:15:00'),
  ('7d8e9f0a-1b2c-3d4e-5f6a-7b8c9d0e1b02', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', FALSE, '2023-04-01 16:30:00', '2023-04-01 16:30:00'),
  ('7d8e9f0a-1b2c-3d4e-5f6a-7b8c9d0e1b03', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 16:45:00', '2023-04-01 16:45:00'),
  ('7d8e9f0a-1b2c-3d4e-5f6a-7b8c9d0e1b04', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'd39c7266-6d9e-492e-adff-13411face70b', FALSE, '2023-04-01 17:00:00', '2023-04-01 17:00:00'),
  ('7d8e9f0a-1b2c-3d4e-5f6a-7b8c9d0e1b05', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', TRUE, '2023-04-01 17:15:00', '2023-04-01 17:15:00');

-- User 8 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2c01', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', TRUE, '2023-04-01 17:30:00', '2023-04-01 17:30:00'),
  ('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2c02', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', FALSE, '2023-04-01 17:45:00', '2023-04-01 17:45:00'),
  ('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2c03', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', TRUE, '2023-04-01 18:00:00', '2023-04-01 18:00:00'),
  ('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2c04', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', 'd39c7266-6d9e-492e-adff-13411face70b', FALSE, '2023-04-01 18:15:00', '2023-04-01 18:15:00'),
  ('8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2c05', '147f799e-f6e6-41a3-bd66-40cd1cde75b4', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 18:30:00', '2023-04-01 18:30:00');

-- User 9 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3d01', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', TRUE, '2023-04-01 18:45:00', '2023-04-01 18:45:00'),
  ('9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3d02', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', FALSE, '2023-04-01 19:00:00', '2023-04-01 19:00:00'),
  ('9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3d03', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', TRUE, '2023-04-01 19:15:00', '2023-04-01 19:15:00'),
  ('9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3d04', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', 'd39c7266-6d9e-492e-adff-13411face70b', FALSE, '2023-04-01 19:30:00', '2023-04-01 19:30:00'),
  ('9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3d05', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', TRUE, '2023-04-01 19:45:00', '2023-04-01 19:45:00');

-- User 10 followers
INSERT INTO "followers" (id, "senderId", "receiverId", status, "createdAt", "updatedAt")
VALUES
  ('a1b2c3d4-4e5f-6a7b-8c9d-0e1f2a3b4e01', 'd39c7266-6d9e-492e-adff-13411face70b', 'b21997a0-e2dd-4998-853e-6ec00f7f8c08', TRUE, '2023-04-01 20:00:00', '2023-04-01 20:00:00'),
  ('a1b2c3d4-4e5f-6a7b-8c9d-0e1f2a3b4e02', 'd39c7266-6d9e-492e-adff-13411face70b', '698efb8c-21d2-4106-bb6b-54f5b278c4ad', FALSE, '2023-04-01 20:15:00', '2023-04-01 20:15:00'),
  ('a1b2c3d4-4e5f-6a7b-8c9d-0e1f2a3b4e03', 'd39c7266-6d9e-492e-adff-13411face70b', 'a0df4b55-ebc9-4354-ba64-67607ca936ad', TRUE, '2023-04-01 20:30:00', '2023-04-01 20:30:00'),
  ('a1b2c3d4-4e5f-6a7b-8c9d-0e1f2a3b4e04', 'd39c7266-6d9e-492e-adff-13411face70b', '1f239c6e-1ec7-4545-a0fa-7a59452baca9', FALSE, '2023-04-01 20:45:00', '2023-04-01 20:45:00'),
  ('a1b2c3d4-4e5f-6a7b-8c9d-0e1f2a3b4e05', 'd39c7266-6d9e-492e-adff-13411face70b', 'c6e8a09d-1510-47fc-ab28-84998f779cc0', TRUE, '2023-04-01 21:00:00', '2023-04-01 21:00:00');