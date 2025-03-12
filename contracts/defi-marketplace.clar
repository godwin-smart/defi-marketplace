;; Title: DeFi-Enabled NFT Marketplace - Advanced DeFi-NFT Integration Layer
;;
;; A groundbreaking protocol that bridges the gap between NFTs and DeFi on Stacks,
;; enabling a new generation of financial primitives for digital assets.
;; 
;; Core Features:
;; - Collateralized NFT minting with dynamic ratios
;; - Decentralized marketplace with protocol-owned liquidity
;; - Advanced staking mechanics with yield generation
;; - Fractional ownership system for enhanced liquidity
;; - Automated reward distribution and fee collection
;;
;; Architecture:
;; The protocol implements a modular design with distinct components for:
;; 1. Core NFT operations (minting, transfers)
;; 2. Marketplace functionality (listing, trading)
;; 3. DeFi integrations (staking, yield)
;; 4. Fractional ownership management
;;
;; Security:
;; - Comprehensive access controls
;; - Safe arithmetic operations
;; - Validated state transitions
;; - Protected reward distributions

;; Constants & Error Codes

(define-constant contract-owner tx-sender)

;; Access Control
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

;; Financial
(define-constant err-insufficient-balance (err u102))
(define-constant err-insufficient-collateral (err u106))

;; NFT Operations
(define-constant err-invalid-token (err u103))
(define-constant err-listing-not-found (err u104))
(define-constant err-invalid-price (err u105))

;; Staking
(define-constant err-already-staked (err u107))
(define-constant err-not-staked (err u108))

;; Validation
(define-constant err-invalid-percentage (err u109))
(define-constant err-invalid-uri (err u110))
(define-constant err-invalid-recipient (err u111))
(define-constant err-overflow (err u112))

;; Protocol Configuration

(define-data-var min-collateral-ratio uint u150)  ;; 150% minimum collateral ratio
(define-data-var protocol-fee uint u25)           ;; 2.5% fee in basis points
(define-data-var total-staked uint u0)
(define-data-var yield-rate uint u50)             ;; 5% annual yield rate in basis points
(define-data-var total-supply uint u0)

;; Data Maps

;; Core NFT Data
(define-map tokens
    { token-id: uint }
    {
        owner: principal,
        uri: (string-ascii 256),
        collateral: uint,
        is-staked: bool,
        stake-timestamp: uint,
        fractional-shares: uint
    }
)