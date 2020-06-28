INSERT INTO public.questions(
	id, created_at, updated_at, description, title)
	VALUES (nextval('question_sequence'), NOW(), NOW(), 'Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue. Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.', 'Sort Colors');
