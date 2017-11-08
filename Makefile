.PHONY: clean tag

clean:
	find . -name "*.aux" -delete
	find . -name "*.log" -delete
	find . -name "*.bbl" -delete
	find . -name "*.tex" -delete
	find . -name ".DS_Store" -delete
