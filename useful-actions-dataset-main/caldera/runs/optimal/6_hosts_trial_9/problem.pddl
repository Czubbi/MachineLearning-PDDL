;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 6 hosts, 35 user, 4 admin per host, 5 active account per host
(define (problem gen)
(:domain caldera)
(:objects id_fuTimeDelta id_giTimeDelta id_gbTimeDelta id_fnTimeDelta id_gpTimeDelta id_gwTimeDelta - ObservedTimeDelta 
 num__180 num__145 num__179 num__151 num__166 num__165 num__172 num__158 num__173 num__152 num__159 num__144 - num 
 id_bbDomainCredential id_bvDomainCredential id_fjDomainCredential id_cpDomainCredential id_epDomainCredential id_chDomainCredential id_dbDomainCredential id_fbDomainCredential id_cxDomainCredential id_dzDomainCredential id_exDomainCredential id_tDomainCredential id_etDomainCredential id_xDomainCredential id_edDomainCredential id_ffDomainCredential id_drDomainCredential id_clDomainCredential id_ctDomainCredential id_bnDomainCredential id_bzDomainCredential id_cdDomainCredential id_hDomainCredential id_lDomainCredential id_bjDomainCredential id_brDomainCredential id_ehDomainCredential id_dfDomainCredential id_dvDomainCredential id_djDomainCredential id_pDomainCredential id_elDomainCredential id_dnDomainCredential id_dDomainCredential id_bfDomainCredential - ObservedDomainCredential 
 id_fmHost id_gaHost id_ftHost id_goHost id_gvHost id_ghHost - ObservedHost 
 id_hrShare id_huShare id_hqShare id_hvShare id_htShare id_hsShare - ObservedShare 
 id_hxFile id_iaFile id_ibFile id_hzFile id_hwFile id_hyFile - ObservedFile 
 id_aDomain - ObservedDomain 
 id_ewDomainUser id_gDomainUser id_duDomainUser id_csDomainUser id_egDomainUser id_dqDomainUser id_esDomainUser id_baDomainUser id_sDomainUser id_eoDomainUser id_kDomainUser id_cwDomainUser id_diDomainUser id_buDomainUser id_biDomainUser id_fiDomainUser id_ecDomainUser id_coDomainUser id_dyDomainUser id_ckDomainUser id_faDomainUser id_feDomainUser id_ccDomainUser id_beDomainUser id_ekDomainUser id_cDomainUser id_byDomainUser id_oDomainUser id_daDomainUser id_deDomainUser id_cgDomainUser id_bmDomainUser id_wDomainUser id_dmDomainUser id_bqDomainUser - ObservedDomainUser 
 id_heSchtask id_hjSchtask id_hhSchtask id_hfSchtask id_hgSchtask id_hiSchtask - ObservedSchtask 
 str__do str__ea str__steven str__gs str__fh str__mary str__ev str__gm str__e str__jennifer str__dk str__ce str__dp str__fx str__y str__fg str__cj str__ej str__dl str__michael str__paul str__z str__sandra str__thomas str__r str__dorothy str__karen str__gg str__kenneth str__fy str__fz str__fk str__j str__maria str__gl str__u str__hd str__cn str__gn str__fd str__dh str__elizabeth str__dc str__james str__dd str__dw str__en str__george str__bw str__eu str__bo str__charles str__ef str__fs str__bd str__cy str__q str__dt str__linda str__betty str__cu str__hb str__margaret str__mark str__ci str__ca str__dx str__william str__cv str__bl str__ge str__helen str__n str__richard str__ez str__m str__ee str__v str__nancy str__er str__ey str__bt str__cq str__bs str__ei str__bg str__cr str__fc str__ha str__fl str__em str__bp str__gt str__christopher str__donald str__b str__john str__eq str__susan str__barbara str__fr str__gu str__fq str__alpha str__robert str__cm str__cb str__gf str__dg str__bx str__eb str__bc str__donna str__i str__bk str__bh str__ds str__gz str__cf str__cz str__daniel str__f str__lisa str__joseph str__patricia str__david - string 
 id_hoRat id_hnRat id_hcRat id_hlRat id_hpRat id_hkRat id_hmRat - ObservedRat 
)
(:init     (knows id_gvHost)
     (knows id_hcRat)
     (knows_property id_gvHost pfqdn)
     (knows_property id_hcRat pexecutable)
     (knows_property id_hcRat phost)
     (mem_cached_domain_creds id_fmHost id_chDomainCredential)
     (mem_cached_domain_creds id_fmHost id_edDomainCredential)
     (mem_cached_domain_creds id_fmHost id_elDomainCredential)
     (mem_cached_domain_creds id_fmHost id_exDomainCredential)
     (mem_cached_domain_creds id_fmHost id_lDomainCredential)
     (mem_cached_domain_creds id_ftHost id_bfDomainCredential)
     (mem_cached_domain_creds id_ftHost id_bnDomainCredential)
     (mem_cached_domain_creds id_ftHost id_bzDomainCredential)
     (mem_cached_domain_creds id_ftHost id_djDomainCredential)
     (mem_cached_domain_creds id_ftHost id_etDomainCredential)
     (mem_cached_domain_creds id_gaHost id_bzDomainCredential)
     (mem_cached_domain_creds id_gaHost id_djDomainCredential)
     (mem_cached_domain_creds id_gaHost id_dnDomainCredential)
     (mem_cached_domain_creds id_gaHost id_fbDomainCredential)
     (mem_cached_domain_creds id_gaHost id_tDomainCredential)
     (mem_cached_domain_creds id_ghHost id_ctDomainCredential)
     (mem_cached_domain_creds id_ghHost id_dfDomainCredential)
     (mem_cached_domain_creds id_ghHost id_etDomainCredential)
     (mem_cached_domain_creds id_ghHost id_exDomainCredential)
     (mem_cached_domain_creds id_ghHost id_lDomainCredential)
     (mem_cached_domain_creds id_goHost id_bjDomainCredential)
     (mem_cached_domain_creds id_goHost id_dbDomainCredential)
     (mem_cached_domain_creds id_goHost id_ffDomainCredential)
     (mem_cached_domain_creds id_goHost id_lDomainCredential)
     (mem_cached_domain_creds id_goHost id_pDomainCredential)
     (mem_cached_domain_creds id_gvHost id_bbDomainCredential)
     (mem_cached_domain_creds id_gvHost id_bnDomainCredential)
     (mem_cached_domain_creds id_gvHost id_cpDomainCredential)
     (mem_cached_domain_creds id_gvHost id_cxDomainCredential)
     (mem_cached_domain_creds id_gvHost id_tDomainCredential)
     (mem_domain_user_admins id_fmHost id_byDomainUser)
     (mem_domain_user_admins id_fmHost id_duDomainUser)
     (mem_domain_user_admins id_fmHost id_eoDomainUser)
     (mem_domain_user_admins id_fmHost id_esDomainUser)
     (mem_domain_user_admins id_ftHost id_csDomainUser)
     (mem_domain_user_admins id_ftHost id_cwDomainUser)
     (mem_domain_user_admins id_ftHost id_deDomainUser)
     (mem_domain_user_admins id_ftHost id_gDomainUser)
     (mem_domain_user_admins id_gaHost id_bmDomainUser)
     (mem_domain_user_admins id_gaHost id_cgDomainUser)
     (mem_domain_user_admins id_gaHost id_dmDomainUser)
     (mem_domain_user_admins id_gaHost id_sDomainUser)
     (mem_domain_user_admins id_ghHost id_ecDomainUser)
     (mem_domain_user_admins id_ghHost id_esDomainUser)
     (mem_domain_user_admins id_ghHost id_fiDomainUser)
     (mem_domain_user_admins id_ghHost id_kDomainUser)
     (mem_domain_user_admins id_goHost id_baDomainUser)
     (mem_domain_user_admins id_goHost id_bqDomainUser)
     (mem_domain_user_admins id_goHost id_cgDomainUser)
     (mem_domain_user_admins id_goHost id_ekDomainUser)
     (mem_domain_user_admins id_gvHost id_ckDomainUser)
     (mem_domain_user_admins id_gvHost id_coDomainUser)
     (mem_domain_user_admins id_gvHost id_esDomainUser)
     (mem_domain_user_admins id_gvHost id_wDomainUser)
     (mem_hosts id_aDomain id_fmHost)
     (mem_hosts id_aDomain id_ftHost)
     (mem_hosts id_aDomain id_gaHost)
     (mem_hosts id_aDomain id_ghHost)
     (mem_hosts id_aDomain id_goHost)
     (mem_hosts id_aDomain id_gvHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_bqDomainUser id_brDomainCredential)
     (prop_cred id_buDomainUser id_bvDomainCredential)
     (prop_cred id_byDomainUser id_bzDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_ccDomainUser id_cdDomainCredential)
     (prop_cred id_cgDomainUser id_chDomainCredential)
     (prop_cred id_ckDomainUser id_clDomainCredential)
     (prop_cred id_coDomainUser id_cpDomainCredential)
     (prop_cred id_csDomainUser id_ctDomainCredential)
     (prop_cred id_cwDomainUser id_cxDomainCredential)
     (prop_cred id_daDomainUser id_dbDomainCredential)
     (prop_cred id_deDomainUser id_dfDomainCredential)
     (prop_cred id_diDomainUser id_djDomainCredential)
     (prop_cred id_dmDomainUser id_dnDomainCredential)
     (prop_cred id_dqDomainUser id_drDomainCredential)
     (prop_cred id_duDomainUser id_dvDomainCredential)
     (prop_cred id_dyDomainUser id_dzDomainCredential)
     (prop_cred id_ecDomainUser id_edDomainCredential)
     (prop_cred id_egDomainUser id_ehDomainCredential)
     (prop_cred id_ekDomainUser id_elDomainCredential)
     (prop_cred id_eoDomainUser id_epDomainCredential)
     (prop_cred id_esDomainUser id_etDomainCredential)
     (prop_cred id_ewDomainUser id_exDomainCredential)
     (prop_cred id_faDomainUser id_fbDomainCredential)
     (prop_cred id_feDomainUser id_ffDomainCredential)
     (prop_cred id_fiDomainUser id_fjDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_fmHost no)
     (prop_dc id_ftHost no)
     (prop_dc id_gaHost no)
     (prop_dc id_ghHost yes)
     (prop_dc id_goHost no)
     (prop_dc id_gvHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_fmHost str__fr)
     (prop_dns_domain_name id_ftHost str__fy)
     (prop_dns_domain_name id_gaHost str__gf)
     (prop_dns_domain_name id_ghHost str__gm)
     (prop_dns_domain_name id_goHost str__gt)
     (prop_dns_domain_name id_gvHost str__ha)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biDomainUser id_aDomain)
     (prop_domain id_bjDomainCredential id_aDomain)
     (prop_domain id_bmDomainUser id_aDomain)
     (prop_domain id_bnDomainCredential id_aDomain)
     (prop_domain id_bqDomainUser id_aDomain)
     (prop_domain id_brDomainCredential id_aDomain)
     (prop_domain id_buDomainUser id_aDomain)
     (prop_domain id_bvDomainCredential id_aDomain)
     (prop_domain id_byDomainUser id_aDomain)
     (prop_domain id_bzDomainCredential id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_ccDomainUser id_aDomain)
     (prop_domain id_cdDomainCredential id_aDomain)
     (prop_domain id_cgDomainUser id_aDomain)
     (prop_domain id_chDomainCredential id_aDomain)
     (prop_domain id_ckDomainUser id_aDomain)
     (prop_domain id_clDomainCredential id_aDomain)
     (prop_domain id_coDomainUser id_aDomain)
     (prop_domain id_cpDomainCredential id_aDomain)
     (prop_domain id_csDomainUser id_aDomain)
     (prop_domain id_ctDomainCredential id_aDomain)
     (prop_domain id_cwDomainUser id_aDomain)
     (prop_domain id_cxDomainCredential id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_daDomainUser id_aDomain)
     (prop_domain id_dbDomainCredential id_aDomain)
     (prop_domain id_deDomainUser id_aDomain)
     (prop_domain id_dfDomainCredential id_aDomain)
     (prop_domain id_diDomainUser id_aDomain)
     (prop_domain id_djDomainCredential id_aDomain)
     (prop_domain id_dmDomainUser id_aDomain)
     (prop_domain id_dnDomainCredential id_aDomain)
     (prop_domain id_dqDomainUser id_aDomain)
     (prop_domain id_drDomainCredential id_aDomain)
     (prop_domain id_duDomainUser id_aDomain)
     (prop_domain id_dvDomainCredential id_aDomain)
     (prop_domain id_dyDomainUser id_aDomain)
     (prop_domain id_dzDomainCredential id_aDomain)
     (prop_domain id_ecDomainUser id_aDomain)
     (prop_domain id_edDomainCredential id_aDomain)
     (prop_domain id_egDomainUser id_aDomain)
     (prop_domain id_ehDomainCredential id_aDomain)
     (prop_domain id_ekDomainUser id_aDomain)
     (prop_domain id_elDomainCredential id_aDomain)
     (prop_domain id_eoDomainUser id_aDomain)
     (prop_domain id_epDomainCredential id_aDomain)
     (prop_domain id_esDomainUser id_aDomain)
     (prop_domain id_etDomainCredential id_aDomain)
     (prop_domain id_ewDomainUser id_aDomain)
     (prop_domain id_exDomainCredential id_aDomain)
     (prop_domain id_faDomainUser id_aDomain)
     (prop_domain id_fbDomainCredential id_aDomain)
     (prop_domain id_feDomainUser id_aDomain)
     (prop_domain id_ffDomainCredential id_aDomain)
     (prop_domain id_fiDomainUser id_aDomain)
     (prop_domain id_fjDomainCredential id_aDomain)
     (prop_domain id_fmHost id_aDomain)
     (prop_domain id_ftHost id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_gaHost id_aDomain)
     (prop_domain id_ghHost id_aDomain)
     (prop_domain id_goHost id_aDomain)
     (prop_domain id_gvHost id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_hcRat yes)
     (prop_executable id_hcRat str__hd)
     (prop_fqdn id_fmHost str__fs)
     (prop_fqdn id_ftHost str__fz)
     (prop_fqdn id_gaHost str__gg)
     (prop_fqdn id_ghHost str__gn)
     (prop_fqdn id_goHost str__gu)
     (prop_fqdn id_gvHost str__hb)
     (prop_host id_fnTimeDelta id_fmHost)
     (prop_host id_fuTimeDelta id_ftHost)
     (prop_host id_gbTimeDelta id_gaHost)
     (prop_host id_giTimeDelta id_ghHost)
     (prop_host id_gpTimeDelta id_goHost)
     (prop_host id_gwTimeDelta id_gvHost)
     (prop_host id_hcRat id_gvHost)
     (prop_hostname id_fmHost str__fq)
     (prop_hostname id_ftHost str__fx)
     (prop_hostname id_gaHost str__ge)
     (prop_hostname id_ghHost str__gl)
     (prop_hostname id_goHost str__gs)
     (prop_hostname id_gvHost str__gz)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_bqDomainUser no)
     (prop_is_group id_buDomainUser no)
     (prop_is_group id_byDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_ccDomainUser no)
     (prop_is_group id_cgDomainUser no)
     (prop_is_group id_ckDomainUser no)
     (prop_is_group id_coDomainUser no)
     (prop_is_group id_csDomainUser no)
     (prop_is_group id_cwDomainUser no)
     (prop_is_group id_daDomainUser no)
     (prop_is_group id_deDomainUser no)
     (prop_is_group id_diDomainUser no)
     (prop_is_group id_dmDomainUser no)
     (prop_is_group id_dqDomainUser no)
     (prop_is_group id_duDomainUser no)
     (prop_is_group id_dyDomainUser no)
     (prop_is_group id_ecDomainUser no)
     (prop_is_group id_egDomainUser no)
     (prop_is_group id_ekDomainUser no)
     (prop_is_group id_eoDomainUser no)
     (prop_is_group id_esDomainUser no)
     (prop_is_group id_ewDomainUser no)
     (prop_is_group id_faDomainUser no)
     (prop_is_group id_feDomainUser no)
     (prop_is_group id_fiDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_fnTimeDelta num__144)
     (prop_microseconds id_fuTimeDelta num__151)
     (prop_microseconds id_gbTimeDelta num__158)
     (prop_microseconds id_giTimeDelta num__165)
     (prop_microseconds id_gpTimeDelta num__172)
     (prop_microseconds id_gwTimeDelta num__179)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_brDomainCredential str__bs)
     (prop_password id_bvDomainCredential str__bw)
     (prop_password id_bzDomainCredential str__ca)
     (prop_password id_cdDomainCredential str__ce)
     (prop_password id_chDomainCredential str__ci)
     (prop_password id_clDomainCredential str__cm)
     (prop_password id_cpDomainCredential str__cq)
     (prop_password id_ctDomainCredential str__cu)
     (prop_password id_cxDomainCredential str__cy)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_dbDomainCredential str__dc)
     (prop_password id_dfDomainCredential str__dg)
     (prop_password id_djDomainCredential str__dk)
     (prop_password id_dnDomainCredential str__do)
     (prop_password id_drDomainCredential str__ds)
     (prop_password id_dvDomainCredential str__dw)
     (prop_password id_dzDomainCredential str__ea)
     (prop_password id_edDomainCredential str__ee)
     (prop_password id_ehDomainCredential str__ei)
     (prop_password id_elDomainCredential str__em)
     (prop_password id_epDomainCredential str__eq)
     (prop_password id_etDomainCredential str__eu)
     (prop_password id_exDomainCredential str__ey)
     (prop_password id_fbDomainCredential str__fc)
     (prop_password id_ffDomainCredential str__fg)
     (prop_password id_fjDomainCredential str__fk)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_fnTimeDelta num__145)
     (prop_seconds id_fuTimeDelta num__152)
     (prop_seconds id_gbTimeDelta num__159)
     (prop_seconds id_giTimeDelta num__166)
     (prop_seconds id_gpTimeDelta num__173)
     (prop_seconds id_gwTimeDelta num__180)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_bqDomainUser str__bt)
     (prop_sid id_buDomainUser str__bx)
     (prop_sid id_byDomainUser str__cb)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_ccDomainUser str__cf)
     (prop_sid id_cgDomainUser str__cj)
     (prop_sid id_ckDomainUser str__cn)
     (prop_sid id_coDomainUser str__cr)
     (prop_sid id_csDomainUser str__cv)
     (prop_sid id_cwDomainUser str__cz)
     (prop_sid id_daDomainUser str__dd)
     (prop_sid id_deDomainUser str__dh)
     (prop_sid id_diDomainUser str__dl)
     (prop_sid id_dmDomainUser str__dp)
     (prop_sid id_dqDomainUser str__dt)
     (prop_sid id_duDomainUser str__dx)
     (prop_sid id_dyDomainUser str__eb)
     (prop_sid id_ecDomainUser str__ef)
     (prop_sid id_egDomainUser str__ej)
     (prop_sid id_ekDomainUser str__en)
     (prop_sid id_eoDomainUser str__er)
     (prop_sid id_esDomainUser str__ev)
     (prop_sid id_ewDomainUser str__ez)
     (prop_sid id_faDomainUser str__fd)
     (prop_sid id_feDomainUser str__fh)
     (prop_sid id_fiDomainUser str__fl)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_fmHost id_fnTimeDelta)
     (prop_timedelta id_ftHost id_fuTimeDelta)
     (prop_timedelta id_gaHost id_gbTimeDelta)
     (prop_timedelta id_ghHost id_giTimeDelta)
     (prop_timedelta id_goHost id_gpTimeDelta)
     (prop_timedelta id_gvHost id_gwTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_brDomainCredential id_bqDomainUser)
     (prop_user id_bvDomainCredential id_buDomainUser)
     (prop_user id_bzDomainCredential id_byDomainUser)
     (prop_user id_cdDomainCredential id_ccDomainUser)
     (prop_user id_chDomainCredential id_cgDomainUser)
     (prop_user id_clDomainCredential id_ckDomainUser)
     (prop_user id_cpDomainCredential id_coDomainUser)
     (prop_user id_ctDomainCredential id_csDomainUser)
     (prop_user id_cxDomainCredential id_cwDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_dbDomainCredential id_daDomainUser)
     (prop_user id_dfDomainCredential id_deDomainUser)
     (prop_user id_djDomainCredential id_diDomainUser)
     (prop_user id_dnDomainCredential id_dmDomainUser)
     (prop_user id_drDomainCredential id_dqDomainUser)
     (prop_user id_dvDomainCredential id_duDomainUser)
     (prop_user id_dzDomainCredential id_dyDomainUser)
     (prop_user id_edDomainCredential id_ecDomainUser)
     (prop_user id_ehDomainCredential id_egDomainUser)
     (prop_user id_elDomainCredential id_ekDomainUser)
     (prop_user id_epDomainCredential id_eoDomainUser)
     (prop_user id_etDomainCredential id_esDomainUser)
     (prop_user id_exDomainCredential id_ewDomainUser)
     (prop_user id_fbDomainCredential id_faDomainUser)
     (prop_user id_ffDomainCredential id_feDomainUser)
     (prop_user id_fjDomainCredential id_fiDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_beDomainUser str__barbara)
     (prop_username id_biDomainUser str__william)
     (prop_username id_bmDomainUser str__elizabeth)
     (prop_username id_bqDomainUser str__david)
     (prop_username id_buDomainUser str__jennifer)
     (prop_username id_byDomainUser str__richard)
     (prop_username id_cDomainUser str__james)
     (prop_username id_ccDomainUser str__maria)
     (prop_username id_cgDomainUser str__charles)
     (prop_username id_ckDomainUser str__susan)
     (prop_username id_coDomainUser str__joseph)
     (prop_username id_csDomainUser str__margaret)
     (prop_username id_cwDomainUser str__thomas)
     (prop_username id_daDomainUser str__dorothy)
     (prop_username id_deDomainUser str__christopher)
     (prop_username id_diDomainUser str__lisa)
     (prop_username id_dmDomainUser str__daniel)
     (prop_username id_dqDomainUser str__nancy)
     (prop_username id_duDomainUser str__paul)
     (prop_username id_dyDomainUser str__karen)
     (prop_username id_ecDomainUser str__mark)
     (prop_username id_egDomainUser str__betty)
     (prop_username id_ekDomainUser str__donald)
     (prop_username id_eoDomainUser str__helen)
     (prop_username id_esDomainUser str__george)
     (prop_username id_ewDomainUser str__sandra)
     (prop_username id_faDomainUser str__kenneth)
     (prop_username id_feDomainUser str__donna)
     (prop_username id_fiDomainUser str__steven)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_hmRat id_ghHost)
     (prop_host id_hoRat id_fmHost)
     (prop_host id_hnRat id_gaHost)
     (prop_host id_hlRat id_goHost)
     (prop_host id_hpRat id_ftHost)
)
)
)