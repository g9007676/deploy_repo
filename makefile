cus_dir := $(shell basename $$PWD)##取當前目錄
www_dir := /home/phpmgr/html/Zheyu
temp_dir := /var/www/temp
remote_host_10 = phpmgr@10.1.1.95
version_dir = /home/webmgr/repoversion
make_file = /home/webmgr/makefile
all:
ifeq ($(cus_dir), app)
	@echo '************  TEST VERSION  ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif
ifeq ($(cus_dir), style)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), auto)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), 3c)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), newsmodels)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), newsschedule)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), newsmobile)
	mkdir -p $(temp_dir)
	@rm -rf $(temp_dir)/mobile2
	@cp  -r $(shell pwd) $(temp_dir)/mobile2
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(temp_dir)/mobile2 $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), cache)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), talk)
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(shell pwd) $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), ent)
	@mkdir -p $(temp_dir)
	@rm -rf $(temp_dir)/ent2
	@cp  -r $(shell pwd) $(temp_dir)/ent2
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(temp_dir)/ent2 $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), sports)
	@mkdir -p $(temp_dir)
	@rm -rf $(temp_dir)/sport
	@cp  -r $(shell pwd) $(temp_dir)/sport
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(temp_dir)/sport $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), sport)
	@mkdir -p $(temp_dir)
	@rm -rf $(temp_dir)/sport
	@cp  -r $(shell pwd) $(temp_dir)/sport
	@echo '************  TEST VERSION ************'
	rsync -av -e "ssh -p 22" --delete --exclude=.git $(temp_dir)/sport $(remote_host_10):$(www_dir)
	@make create_version -f $(make_file) n=$(n)
	@echo '************   Complete   ************'
endif

ifeq ($(cus_dir), Ltmana)
endif

var_number=`date '+%Y-%m-%d:%H:%M:%S'`
create_version:
	@mkdir -p $(version_dir)
ifeq ($(strip $(n)),)
else
	@echo $(n)::$(var_number) >> $(version_dir)/$(cus_dir).txt
endif

log_file =$(version_dir)/$(cus_dir).txt
get_version:
	@cat   $(log_file) |  awk -F "::" '{ print "Vertion:\033[1;31m" $$1 "\033[0m       Time:\033[1;32m" $$2 "\033[0m "}'
