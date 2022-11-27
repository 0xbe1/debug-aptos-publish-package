module swap::swap {
    use std::signer;
    use aptos_framework::account::SignerCapability;
    use swap::lp_account;
    
    struct StablePoolAccountCapability has key { signer_cap: SignerCapability }

    public entry fun initialize(manager: &signer) {
        assert!(signer::address_of(manager) == @swap, 0);

        let signer_cap = lp_account::retrieve_signer_cap(manager);
        move_to(manager, StablePoolAccountCapability { signer_cap });
    }
}
