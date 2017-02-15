var /*Int*/ i;

/*
 * Tries to find matching identities for a given account, on different fields
 */
function recon() {
	var /*java.util.HashMap*/ params;
	var result;
	for( i = 0; i < dataset.accounts.length; i++ ) {
		if( dataset.accountsHRCode.get(i) != null) {
			params = new java.util.HashMap();
			params.put('hrcode', dataset.accountsHRCode.get(i));
			params.put('fuzzynb', dataset.fuzzyNB.get());
			result = workflow.executeView(null, 'bw_recon_identities' , params);
			if( result != null && result.length > 0 ) {
				dataset.accountsHasID.set(i, true);
				continue;
			}
		}
		if( dataset.accountsFullname.get(i) != null) {
			params = new java.util.HashMap();
			params.put('fullname', dataset.accountsFullname.get(i));
			params.put('fuzzynb', dataset.fuzzyNB.get());
			result = workflow.executeView(null, 'bw_recon_identities' , params);
			if( result != null && result.length > 0 ) {
				dataset.accountsHasID.set(i, true);
				continue;
			}
		}
		if( dataset.accountsGivenname.get(i) != null) {
			params = new java.util.HashMap();
			params.put('givenname', dataset.accountsGivenname.get(i));
			params.put('fuzzynb', dataset.fuzzyNB.get());
			result = workflow.executeView(null, 'bw_recon_identities' , params);
			if( result != null && result.length > 0 ) {
				dataset.accountsHasID.set(i, true);
				continue;
			}
		}
		if( dataset.accountsSurname.get(i) != null) {
			params = new java.util.HashMap();
			params.put('surname', dataset.accountsSurname.get(i));
			params.put('fuzzynb', dataset.fuzzyNB.get());
			result = workflow.executeView(null, 'bw_recon_identities' , params);
			if( result != null && result.length > 0 ) {
				dataset.accountsHasID.set(i, true);
				continue;
			}
		}
		if( dataset.accountsMail.get(i) != null) {
			params = new java.util.HashMap();
			params.put('mail', dataset.accountsMail.get(i));
			params.put('fuzzynb', dataset.fuzzyNB.get());
			result = workflow.executeView(null, 'bw_recon_identities' , params);
			if( result != null && result.length > 0 ) {
				dataset.accountsHasID.set(i, true);
				continue;
			}
		}
		
	}
}