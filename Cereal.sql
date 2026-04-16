create database food;
use food;
drop table if exists cereal cascade;
create table cereal (
	 id serial not null primary key, 
	name varchar(64),
	mfr varchar(64),
	type varchar(64),
	calories decimal,
	protein decimal,
	fat decimal,
	sodium decimal,
	fiber decimal,
	carbo decimal,
	sugars decimal,
	potass decimal,
	vitamins decimal,
	shelf decimal,
	weight decimal,
	cups decimal,
	rating decimal
		
);

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  '100% Bran' ,   'N' ,   'C' ,   70 ,   4 ,   1 ,   130 ,   10 ,   5 ,   6 ,   280 ,   25 ,   3 ,   1 ,   0.33 ,   68.402973   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  '100% Natural Bran' ,   'Q' ,   'C' ,   120 ,   3 ,   5 ,   15 ,   2 ,   8 ,   8 ,   135 ,   0 ,   3 ,   1 ,   1 ,   33.983679   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'All-Bran' ,   'K' ,   'C' ,   70 ,   4 ,   1 ,   260 ,   9 ,   7 ,   5 ,   320 ,   25 ,   3 ,   1 ,   0.33 ,   59.425505   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'All-Bran with Extra Fiber' ,   'K' ,   'C' ,   50 ,   4 ,   0 ,   140 ,   14 ,   8 ,   0 ,   330 ,   25 ,   3 ,   1 ,   0.5 ,   93.704912   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Almond Delight' ,   'R' ,   'C' ,   110 ,   2 ,   2 ,   200 ,   1 ,   14 ,   8 ,   -1 ,   25 ,   3 ,   1 ,   0.75 ,   34.384843   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Apple Cinnamon Cheerios' ,   'G' ,   'C' ,   110 ,   2 ,   2 ,   180 ,   1.5 ,   10.5 ,   10 ,   70 ,   25 ,   1 ,   1 ,   0.75 ,   29.509541   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Apple Jacks' ,   'K' ,   'C' ,   110 ,   2 ,   0 ,   125 ,   1 ,   11 ,   14 ,   30 ,   25 ,   2 ,   1 ,   1 ,   33.174094   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Basic 4' ,   'G' ,   'C' ,   130 ,   3 ,   2 ,   210 ,   2 ,   18 ,   8 ,   100 ,   25 ,   3 ,   1.33 ,   0.75 ,   37.038562   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Bran Chex' ,   'R' ,   'C' ,   90 ,   2 ,   1 ,   200 ,   4 ,   15 ,   6 ,   125 ,   25 ,   1 ,   1 ,   0.67 ,   49.120253   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Bran Flakes' ,   'P' ,   'C' ,   90 ,   3 ,   0 ,   210 ,   5 ,   13 ,   5 ,   190 ,   25 ,   3 ,   1 ,   0.67 ,   53.313813   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cap''n''Crunch' ,   'Q' ,   'C' ,   120 ,   1 ,   2 ,   220 ,   0 ,   12 ,   12 ,   35 ,   25 ,   2 ,   1 ,   0.75 ,   18.042851   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cheerios' ,   'G' ,   'C' ,   110 ,   6 ,   2 ,   290 ,   2 ,   17 ,   1 ,   105 ,   25 ,   1 ,   1 ,   1.25 ,   50.764999   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cinnamon Toast Crunch' ,   'G' ,   'C' ,   120 ,   1 ,   3 ,   210 ,   0 ,   13 ,   9 ,   45 ,   25 ,   2 ,   1 ,   0.75 ,   19.823573   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Clusters' ,   'G' ,   'C' ,   110 ,   3 ,   2 ,   140 ,   2 ,   13 ,   7 ,   105 ,   25 ,   3 ,   1 ,   0.5 ,   40.400208   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cocoa Puffs' ,   'G' ,   'C' ,   110 ,   1 ,   1 ,   180 ,   0 ,   12 ,   13 ,   55 ,   25 ,   2 ,   1 ,   1 ,   22.736446   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Corn Chex' ,   'R' ,   'C' ,   110 ,   2 ,   0 ,   280 ,   0 ,   22 ,   3 ,   25 ,   25 ,   1 ,   1 ,   1 ,   41.445019   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Corn Flakes' ,   'K' ,   'C' ,   100 ,   2 ,   0 ,   290 ,   1 ,   21 ,   2 ,   35 ,   25 ,   1 ,   1 ,   1 ,   45.863324   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Corn Pops' ,   'K' ,   'C' ,   110 ,   1 ,   0 ,   90 ,   1 ,   13 ,   12 ,   20 ,   25 ,   2 ,   1 ,   1 ,   35.782791   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Count Chocula' ,   'G' ,   'C' ,   110 ,   1 ,   1 ,   180 ,   0 ,   12 ,   13 ,   65 ,   25 ,   2 ,   1 ,   1 ,   22.396513   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cracklin'' Oat Bran' ,   'K' ,   'C' ,   110 ,   3 ,   3 ,   140 ,   4 ,   10 ,   7 ,   160 ,   25 ,   3 ,   1 ,   0.5 ,   40.448772   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Cream of Wheat (Quick)' ,   'N' ,   'H' ,   100 ,   3 ,   0 ,   80 ,   1 ,   21 ,   0 ,   -1 ,   0 ,   2 ,   1 ,   1 ,   64.533816   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Crispix' ,   'K' ,   'C' ,   110 ,   2 ,   0 ,   220 ,   1 ,   21 ,   3 ,   30 ,   25 ,   3 ,   1 ,   1 ,   46.895644   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Crispy Wheat & Raisins' ,   'G' ,   'C' ,   100 ,   2 ,   1 ,   140 ,   2 ,   11 ,   10 ,   120 ,   25 ,   3 ,   1 ,   0.75 ,   36.176196   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Double Chex' ,   'R' ,   'C' ,   100 ,   2 ,   0 ,   190 ,   1 ,   18 ,   5 ,   80 ,   25 ,   3 ,   1 ,   0.75 ,   44.330856   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Froot Loops' ,   'K' ,   'C' ,   110 ,   2 ,   1 ,   125 ,   1 ,   11 ,   13 ,   30 ,   25 ,   2 ,   1 ,   1 ,   32.207582   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Frosted Flakes' ,   'K' ,   'C' ,   110 ,   1 ,   0 ,   200 ,   1 ,   14 ,   11 ,   25 ,   25 ,   1 ,   1 ,   0.75 ,   31.435973   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Frosted Mini-Wheats' ,   'K' ,   'C' ,   100 ,   3 ,   0 ,   0 ,   3 ,   14 ,   7 ,   100 ,   25 ,   2 ,   1 ,   0.8 ,   58.345141   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Fruit & Fibre Dates, Walnuts, and Oats' ,   'P' ,   'C' ,   120 ,   3 ,   2 ,   160 ,   5 ,   12 ,   10 ,   200 ,   25 ,   3 ,   1.25 ,   0.67 ,   40.917047   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Fruitful Bran' ,   'K' ,   'C' ,   120 ,   3 ,   0 ,   240 ,   5 ,   14 ,   12 ,   190 ,   25 ,   3 ,   1.33 ,   0.67 ,   41.015492   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Fruity Pebbles' ,   'P' ,   'C' ,   110 ,   1 ,   1 ,   135 ,   0 ,   13 ,   12 ,   25 ,   25 ,   2 ,   1 ,   0.75 ,   28.025765   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Golden Crisp' ,   'P' ,   'C' ,   100 ,   2 ,   0 ,   45 ,   0 ,   11 ,   15 ,   40 ,   25 ,   1 ,   1 ,   0.88 ,   35.252444   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Golden Grahams' ,   'G' ,   'C' ,   110 ,   1 ,   1 ,   280 ,   0 ,   15 ,   9 ,   45 ,   25 ,   2 ,   1 ,   0.75 ,   23.804043   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Grape Nuts Flakes' ,   'P' ,   'C' ,   100 ,   3 ,   1 ,   140 ,   3 ,   15 ,   5 ,   85 ,   25 ,   3 ,   1 ,   0.88 ,   52.076897   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Grape-Nuts' ,   'P' ,   'C' ,   110 ,   3 ,   0 ,   170 ,   3 ,   17 ,   3 ,   90 ,   25 ,   3 ,   1 ,   0.25 ,   53.371007   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Great Grains Pecan' ,   'P' ,   'C' ,   120 ,   3 ,   3 ,   75 ,   3 ,   13 ,   4 ,   100 ,   25 ,   3 ,   1 ,   0.33 ,   45.811716   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Honey Graham Ohs' ,   'Q' ,   'C' ,   120 ,   1 ,   2 ,   220 ,   1 ,   12 ,   11 ,   45 ,   25 ,   2 ,   1 ,   1 ,   21.871292   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Honey Nut Cheerios' ,   'G' ,   'C' ,   110 ,   3 ,   1 ,   250 ,   1.5 ,   11.5 ,   10 ,   90 ,   25 ,   1 ,   1 ,   0.75 ,   31.072217   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Honey-comb' ,   'P' ,   'C' ,   110 ,   1 ,   0 ,   180 ,   0 ,   14 ,   11 ,   35 ,   25 ,   1 ,   1 ,   1.33 ,   28.742414   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Just Right Crunchy  Nuggets' ,   'K' ,   'C' ,   110 ,   2 ,   1 ,   170 ,   1 ,   17 ,   6 ,   60 ,   100 ,   3 ,   1 ,   1 ,   36.523683   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Just Right Fruit & Nut' ,   'K' ,   'C' ,   140 ,   3 ,   1 ,   170 ,   2 ,   20 ,   9 ,   95 ,   100 ,   3 ,   1.3 ,   0.75 ,   36.471512   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Kix' ,   'G' ,   'C' ,   110 ,   2 ,   1 ,   260 ,   0 ,   21 ,   3 ,   40 ,   25 ,   2 ,   1 ,   1.5 ,   39.241114   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Life' ,   'Q' ,   'C' ,   100 ,   4 ,   2 ,   150 ,   2 ,   12 ,   6 ,   95 ,   25 ,   2 ,   1 ,   0.67 ,   45.328074   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Lucky Charms' ,   'G' ,   'C' ,   110 ,   2 ,   1 ,   180 ,   0 ,   12 ,   12 ,   55 ,   25 ,   2 ,   1 ,   1 ,   26.734515   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Maypo' ,   'A' ,   'H' ,   100 ,   4 ,   1 ,   0 ,   0 ,   16 ,   3 ,   95 ,   25 ,   2 ,   1 ,   1 ,   54.850917   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Muesli Raisins, Dates, & Almonds' ,   'R' ,   'C' ,   150 ,   4 ,   3 ,   95 ,   3 ,   16 ,   11 ,   170 ,   25 ,   3 ,   1 ,   1 ,   37.136863   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Muesli Raisins, Peaches, & Pecans' ,   'R' ,   'C' ,   150 ,   4 ,   3 ,   150 ,   3 ,   16 ,   11 ,   170 ,   25 ,   3 ,   1 ,   1 ,   34.139765   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Mueslix Crispy Blend' ,   'K' ,   'C' ,   160 ,   3 ,   2 ,   150 ,   3 ,   17 ,   13 ,   160 ,   25 ,   3 ,   1.5 ,   0.67 ,   30.313351   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Multi-Grain Cheerios' ,   'G' ,   'C' ,   100 ,   2 ,   1 ,   220 ,   2 ,   15 ,   6 ,   90 ,   25 ,   1 ,   1 ,   1 ,   40.105965   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Nut&Honey Crunch' ,   'K' ,   'C' ,   120 ,   2 ,   1 ,   190 ,   0 ,   15 ,   9 ,   40 ,   25 ,   2 ,   1 ,   0.67 ,   29.924285   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Nutri-Grain Almond-Raisin' ,   'K' ,   'C' ,   140 ,   3 ,   2 ,   220 ,   3 ,   21 ,   7 ,   130 ,   25 ,   3 ,   1.33 ,   0.67 ,   40.692320   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Nutri-grain Wheat' ,   'K' ,   'C' ,   90 ,   3 ,   0 ,   170 ,   3 ,   18 ,   2 ,   90 ,   25 ,   3 ,   1 ,   1 ,   59.642837   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Oatmeal Raisin Crisp' ,   'G' ,   'C' ,   130 ,   3 ,   2 ,   170 ,   1.5 ,   13.5 ,   10 ,   120 ,   25 ,   3 ,   1.25 ,   0.5 ,   30.450843   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Post Nat. Raisin Bran' ,   'P' ,   'C' ,   120 ,   3 ,   1 ,   200 ,   6 ,   11 ,   14 ,   260 ,   25 ,   3 ,   1.33 ,   0.67 ,   37.840594   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Product 19' ,   'K' ,   'C' ,   100 ,   3 ,   0 ,   320 ,   1 ,   20 ,   3 ,   45 ,   100 ,   3 ,   1 ,   1 ,   41.503540   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Puffed Rice' ,   'Q' ,   'C' ,   50 ,   1 ,   0 ,   0 ,   0 ,   13 ,   0 ,   15 ,   0 ,   3 ,   0.5 ,   1 ,   60.756112   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Puffed Wheat' ,   'Q' ,   'C' ,   50 ,   2 ,   0 ,   0 ,   1 ,   10 ,   0 ,   50 ,   0 ,   3 ,   0.5 ,   1 ,   63.005645   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Quaker Oat Squares' ,   'Q' ,   'C' ,   100 ,   4 ,   1 ,   135 ,   2 ,   14 ,   6 ,   110 ,   25 ,   3 ,   1 ,   0.5 ,   49.511874   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Quaker Oatmeal' ,   'Q' ,   'H' ,   100 ,   5 ,   2 ,   0 ,   2.7 ,   -1 ,   -1 ,   110 ,   0 ,   1 ,   1 ,   0.67 ,   50.828392   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Raisin Bran' ,   'K' ,   'C' ,   120 ,   3 ,   1 ,   210 ,   5 ,   14 ,   12 ,   240 ,   25 ,   2 ,   1.33 ,   0.75 ,   39.259197   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Raisin Nut Bran' ,   'G' ,   'C' ,   100 ,   3 ,   2 ,   140 ,   2.5 ,   10.5 ,   8 ,   140 ,   25 ,   3 ,   1 ,   0.5 ,   39.703400   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Raisin Squares' ,   'K' ,   'C' ,   90 ,   2 ,   0 ,   0 ,   2 ,   15 ,   6 ,   110 ,   25 ,   3 ,   1 ,   0.5 ,   55.333142   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Rice Chex' ,   'R' ,   'C' ,   110 ,   1 ,   0 ,   240 ,   0 ,   23 ,   2 ,   30 ,   25 ,   1 ,   1 ,   1.13 ,   41.998933   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Rice Krispies' ,   'K' ,   'C' ,   110 ,   2 ,   0 ,   290 ,   0 ,   22 ,   3 ,   35 ,   25 ,   1 ,   1 ,   1 ,   40.560159   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Shredded Wheat' ,   'N' ,   'C' ,   80 ,   2 ,   0 ,   0 ,   3 ,   16 ,   0 ,   95 ,   0 ,   1 ,   0.83 ,   1 ,   68.235885   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Shredded Wheat ''n''Bran' ,   'N' ,   'C' ,   90 ,   3 ,   0 ,   0 ,   4 ,   19 ,   0 ,   140 ,   0 ,   1 ,   1 ,   0.67 ,   74.472949   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Shredded Wheat spoon size' ,   'N' ,   'C' ,   90 ,   3 ,   0 ,   0 ,   3 ,   20 ,   0 ,   120 ,   0 ,   1 ,   1 ,   0.67 ,   72.801787   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Smacks' ,   'K' ,   'C' ,   110 ,   2 ,   1 ,   70 ,   1 ,   9 ,   15 ,   40 ,   25 ,   2 ,   1 ,   0.75 ,   31.230054   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Special K' ,   'K' ,   'C' ,   110 ,   6 ,   0 ,   230 ,   1 ,   16 ,   3 ,   55 ,   25 ,   1 ,   1 ,   1 ,   53.131324   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Strawberry Fruit Wheats' ,   'N' ,   'C' ,   90 ,   2 ,   0 ,   15 ,   3 ,   15 ,   5 ,   90 ,   25 ,   2 ,   1 ,   1 ,   59.363993   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Total Corn Flakes' ,   'G' ,   'C' ,   110 ,   2 ,   1 ,   200 ,   0 ,   21 ,   3 ,   35 ,   100 ,   3 ,   1 ,   1 ,   38.839746   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Total Raisin Bran' ,   'G' ,   'C' ,   140 ,   3 ,   1 ,   190 ,   4 ,   15 ,   14 ,   230 ,   100 ,   3 ,   1.5 ,   1 ,   28.592785   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Total Whole Grain' ,   'G' ,   'C' ,   100 ,   3 ,   1 ,   200 ,   3 ,   16 ,   3 ,   110 ,   100 ,   3 ,   1 ,   1 ,   46.658844   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Triples' ,   'G' ,   'C' ,   110 ,   2 ,   1 ,   250 ,   0 ,   21 ,   3 ,   60 ,   25 ,   3 ,   1 ,   0.75 ,   39.106174   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Trix' ,   'G' ,   'C' ,   110 ,   1 ,   1 ,   140 ,   0 ,   13 ,   12 ,   25 ,   25 ,   2 ,   1 ,   1 ,   27.753301   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Wheat Chex' ,   'R' ,   'C' ,   100 ,   3 ,   1 ,   230 ,   3 ,   17 ,   3 ,   115 ,   25 ,   1 ,   1 ,   0.67 ,   49.787445   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Wheaties' ,   'G' ,   'C' ,   100 ,   3 ,   1 ,   200 ,   3 ,   17 ,   3 ,   110 ,   25 ,   1 ,   1 ,   1 ,   51.592193   );

insert into cereal (  name ,   mfr ,   type ,   calories ,   protein ,   fat ,   sodium ,   fiber ,   carbo ,   sugars ,   potass ,   vitamins ,   shelf ,   weight ,   cups ,   rating   )
	values (  'Wheaties Honey Gold' ,   'G' ,   'C' ,   110 ,   2 ,   1 ,   200 ,   1 ,   16 ,   8 ,   60 ,   25 ,   1 ,   1 ,   0.75 ,   36.187559   );

select * from cereal;

select * from cereal order by calories desc limit 3;

select * from (
	select * from cereal order by calories)
cals order by protein desc limit 10;

select id, name, calories, protein, round(protein/calories, 2) as protein_cal_ratio from cereal 
	order by protein_cal_ratio desc;
    

    
