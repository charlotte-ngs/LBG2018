###
###
###
###   Purpose:   Deployment And Publication Of Course Material
###   started:   2018-10-31 (pvr)
###
### ############################################################# ###

#' @title Deployment Of Course Material
#' 
#' @description 
#' The term deployment stands for copying the content of a directory 
#' given by the parameter ps_deploy_path to a certain target directory
#' 
#' @param ps_deploy_path    path to file or directory to be deployed
#' @param ps_deploy_target  deployment target directory
deploy_course_material <- function(ps_deploy_path, ps_deploy_target){
  ### # check whether ps_deploy_path exists, stop if not
  if ( !file.exists(ps_deploy_path) )
    stop("[ERROR: deploy_course_material] Cannot find ", ps_deploy_path)
  
  ### # if deploy target does not exist, create it
  if ( !dir.exists(ps_deploy_target) ) {
    cat("[INFO -- deploy_course_material] Create deployment target", ps_deploy_target, " ...\n")
    dir.create(path = ps_deploy_target)
  }
  
  ### # copy the content
  s_deploy_path <- ps_deploy_path
  ### # if s_deploy_path is a file, the switch to its direname
  if ( !file.info(s_deploy_path)$isdir )
    s_deploy_path <- dirname(s_deploy_path)
  
  ### # go over directory content and deploy via copying
  vec_deploy_content <- list.files(s_deploy_path, full.names = TRUE)
  file.copy(from = vec_deploy_content, to = ps_deploy_target, recursive = TRUE)
  
  return(invisible(TRUE))
}


#' @title Publish a Document To a Given Target Directory
#' 
#' @description 
#' A document specified by the parameter ps_publish_path is 
#' moved to a given target directory.
#' 
#' @param  ps_publish_path   path to file to be published
#' @param  ps_publish_target publication target directory
publish_course_material <- function(ps_publish_path, ps_publish_target){
  ### # check whether ps_publish_path exists, stop if not
  if ( !file.exists(ps_publish_path) )
    stop("[ERROR -- publish_course_material] Cannot find ", ps_publish_path)
  
  ### # if deploy target does not exist, create it
  if ( !dir.exists(ps_publish_target) ) {
    cat("[INFO -- publish_course_material] Create deployment target: ", ps_publish_target, " ...\n")
    dir.create(path = ps_publish_target)
  }
  
  ### # move the file to be published
  file_move(ps_source = ps_publish_path, ps_target = ps_publish_target)
  
  ### # return invisible
  return(invisible(TRUE))
}


#' @title Move a File Into a Target Directory
#' 
#' @description 
#' This is a helber function that uses \code{file.rename} to 
#' move a given file into a target directory.
#' 
#' @param ps_source   source file to be moved
#' @param ps_tartget  target directory
file_move <- function(ps_source, ps_target){
  ### # check whether ps_source exists
  if( !file.exists(ps_source) )
    stop("[ERROR -- file_move] Cannot find: ", ps_source)
  
  ### # check whether target exists
  if ( !dir.exists(ps_target) ){
    cat("[INFO --file_move] Create target directory: ", ps_target, " ...\n")
    dir.create(path = ps_target)
  }
  
  ### # moving via renaming
  s_source_bname <- basename(ps_source)
  file.rename(from = ps_source, to = file.path(ps_target, s_source_bname))
  
  ### # return invisible
  return(invisible(TRUE))
  
}