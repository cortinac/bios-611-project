PHONY: clean

clean:
	rm -f derived_data/*
	rm -f figures/*

derived_data/vax_data.csv: import_data.R
	mkdir -p derived_data
	Rscript import_data.R

derived_data/clean.csv: derived_data/vax_data.csv clean_vax_data.R
	Rscript clean_vax_data.R
