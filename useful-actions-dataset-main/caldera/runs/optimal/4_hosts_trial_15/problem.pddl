;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 4 hosts, 8 user, 2 admin per host, 2 active account per host
(define (problem gen)
(:domain caldera)
(:objects id_ceTimeDelta id_bxTimeDelta id_bqTimeDelta id_bjTimeDelta - ObservedTimeDelta 
 id_sDomainUser id_wDomainUser id_gDomainUser id_baDomainUser id_beDomainUser id_oDomainUser id_kDomainUser id_cDomainUser - ObservedDomainUser 
 id_cqFile id_crFile id_ctFile id_csFile - ObservedFile 
 num__44 num__57 num__58 num__36 num__37 num__43 num__50 num__51 - num 
 id_bpHost id_bwHost id_cdHost id_biHost - ObservedHost 
 id_dDomainCredential id_pDomainCredential id_xDomainCredential id_hDomainCredential id_lDomainCredential id_bbDomainCredential id_tDomainCredential id_bfDomainCredential - ObservedDomainCredential 
 id_czShare id_dbShare id_daShare id_cyShare - ObservedShare 
 id_aDomain - ObservedDomain 
 id_coSchtask id_cnSchtask id_cpSchtask id_cmSchtask - ObservedSchtask 
 id_cuRat id_cvRat id_ckRat id_cxRat id_cwRat - ObservedRat 
 str__linda str__patricia str__ca str__bd str__ci str__q str__bo str__cc str__bm str__r str__bt str__b str__m str__j str__bv str__cj str__cl str__bc str__u str__mary str__cb str__bn str__ch str__bu str__michael str__bh str__e str__f str__alpha str__barbara str__bg str__z str__v str__y str__robert str__i str__john str__n str__james - string 
)
(:init     (knows id_bpHost)
     (knows id_ckRat)
     (knows_property id_bpHost pfqdn)
     (knows_property id_ckRat pexecutable)
     (knows_property id_ckRat phost)
     (mem_cached_domain_creds id_biHost id_pDomainCredential)
     (mem_cached_domain_creds id_biHost id_tDomainCredential)
     (mem_cached_domain_creds id_bpHost id_bbDomainCredential)
     (mem_cached_domain_creds id_bpHost id_xDomainCredential)
     (mem_cached_domain_creds id_bwHost id_lDomainCredential)
     (mem_cached_domain_creds id_bwHost id_xDomainCredential)
     (mem_cached_domain_creds id_cdHost id_bbDomainCredential)
     (mem_cached_domain_creds id_cdHost id_hDomainCredential)
     (mem_domain_user_admins id_biHost id_beDomainUser)
     (mem_domain_user_admins id_biHost id_gDomainUser)
     (mem_domain_user_admins id_bpHost id_baDomainUser)
     (mem_domain_user_admins id_bpHost id_oDomainUser)
     (mem_domain_user_admins id_bwHost id_oDomainUser)
     (mem_domain_user_admins id_bwHost id_wDomainUser)
     (mem_domain_user_admins id_cdHost id_baDomainUser)
     (mem_domain_user_admins id_cdHost id_wDomainUser)
     (mem_hosts id_aDomain id_biHost)
     (mem_hosts id_aDomain id_bpHost)
     (mem_hosts id_aDomain id_bwHost)
     (mem_hosts id_aDomain id_cdHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_biHost no)
     (prop_dc id_bpHost no)
     (prop_dc id_bwHost no)
     (prop_dc id_cdHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_biHost str__bo)
     (prop_dns_domain_name id_bpHost str__bv)
     (prop_dns_domain_name id_bwHost str__cc)
     (prop_dns_domain_name id_cdHost str__cj)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biHost id_aDomain)
     (prop_domain id_bpHost id_aDomain)
     (prop_domain id_bwHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cdHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_ckRat yes)
     (prop_executable id_ckRat str__cl)
     (prop_fqdn id_biHost str__bn)
     (prop_fqdn id_bpHost str__bu)
     (prop_fqdn id_bwHost str__cb)
     (prop_fqdn id_cdHost str__ci)
     (prop_host id_bjTimeDelta id_biHost)
     (prop_host id_bqTimeDelta id_bpHost)
     (prop_host id_bxTimeDelta id_bwHost)
     (prop_host id_ceTimeDelta id_cdHost)
     (prop_host id_ckRat id_bpHost)
     (prop_hostname id_biHost str__bm)
     (prop_hostname id_bpHost str__bt)
     (prop_hostname id_bwHost str__ca)
     (prop_hostname id_cdHost str__ch)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_bjTimeDelta num__37)
     (prop_microseconds id_bqTimeDelta num__44)
     (prop_microseconds id_bxTimeDelta num__51)
     (prop_microseconds id_ceTimeDelta num__58)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_bjTimeDelta num__36)
     (prop_seconds id_bqTimeDelta num__43)
     (prop_seconds id_bxTimeDelta num__50)
     (prop_seconds id_ceTimeDelta num__57)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_biHost id_bjTimeDelta)
     (prop_timedelta id_bpHost id_bqTimeDelta)
     (prop_timedelta id_bwHost id_bxTimeDelta)
     (prop_timedelta id_cdHost id_ceTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_beDomainUser str__barbara)
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_cwRat id_biHost)
     (prop_host id_cuRat id_bwHost)
     (prop_host id_cvRat id_cdHost)
)
)
)