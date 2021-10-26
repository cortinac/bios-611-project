PHONY: clean

clean:
	rm derived_data/*
	rm figures/*

derived_data/vax_data.csv: import_data.R
	Rscript import_data.R

derived_data/clean.csv: derived_data/vax_data.csv clean_vax_data.R
	Rscript clean_vax_data.R
