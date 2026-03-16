BEGIN;

UPDATE public.tkxk
	SET tkdinhkem= REPLACE(tkdinhkem, 'https://nb.hhhd.myds.me',''), 
	lhtdinhkem=REPLACE(lhtdinhkem, 'https://nb.hhhd.myds.me','');

COMMIT;
