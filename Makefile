report.pdf: report.Rmd figures/avg_chg.png figures/avg.png figures/rate.png figures/svi_avg.png figures/svi_chg.png figures/svi_rate.png
	R -e "rmarkdown::render('report.Rmd',output_format='pdf_document')"
	rm Rplots.pdf

PHONY: clean

clean:
	rm -f derived_data/*
	rm -f figures/*
	rm -f report.pdf

derived_data/vax_data.csv: import_data.R
	mkdir -p derived_data
	mkdir -p figures
	Rscript import_data.R

derived_data/clean.csv: derived_data/vax_data.csv clean_vax_data.R
	Rscript clean_vax_data.R

derived_data/us_avg.csv derived_data/metro_avg.csv derived_data/nonmetro_avg.csv: derived_data/clean.csv averages.R
	Rscript averages.R
	
derived_data/us_rate.csv derived_data/metro_rate.csv derived_data/nonmetro_rate.csv: derived_data/clean.csv rates.R
	Rscript rates.R
	
figures/avg.png figures/avg_chg.png: derived_data/us_avg.csv derived_data/metro_avg.csv derived_data/nonmetro_avg.csv figures_averages.R
	Rscript figures_averages.R

figures/rate.png: derived_data/us_rate.csv derived_data/metro_rate.csv derived_data/nonmetro_rate.csv figures_rates.R
	Rscript figures_rates.R
	
derived_data/svi_a.csv derived_data/svi_b.csv derived_data/svi_c.csv derived_data/svi_d.csv derived_data/svi_a_rate.csv\
derived_data/svi_b_rate.csv derived_data/svi_c_rate.csv derived_data/svi_d_rate.csv: derived_data/clean.csv svi.R
	Rscript svi.R
	
derived_data/m2m.csv: derived_data/clean.csv m2m.R
	Rscript m2m.R
	
derived_data/chg.csv: derived_data/clean.csv chg.R
	Rscript chg.R
	
derived_data/negative_chg.csv: derived_data/chg.csv negative_chg.R
	Rscript negative_chg.R
	
derived_data/svi_themes.csv: source_data/SVI2018_US_COUNTY.csv clean_svi.R
	Rscript clean_svi.R
	
derived_data/clean_svi.csv: derived_data/svi_themes.csv derived_data/clean.csv merge_svi.R
	merge_svi.R

figures/svi_avg.png figures/svi_chg.png: derived_data/us_avg.csv derived_data/svi_a.csv derived_data/svi_b.csv derived_data/svi_c.csv derived_data/svi_d.csv svi_figures.R
	Rscript svi_figures.R
	
figures/svi_rate.png: derived_data/us_rate.csv derived_data/svi_a_rate.csv derived_data/svi_b_rate.csv derived_data/svi_c_rate.csv derived_data/svi_d_rate.csv svi_rate.R
	Rscript svi_rate.R
	
PHONY: shiny

shiny: derived_data/clean.csv line_graphs_counties.R
	Rscript line_graphs_counties.R