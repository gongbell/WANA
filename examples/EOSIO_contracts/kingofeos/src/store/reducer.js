import Eos from 'eosjs'
import { network } from '../utils/eos'

export const initialState = {
    currentKingdomOrder: Number.MAX_SAFE_INTEGER,
    currentKingdomKings: [],
    hallOfFameKings: [],
    // which kings are shown as castles in the canvas
    canvasKings: [],
    modal: {
        open: false,
        loading: false,
        error: ``,
    },
    scatter: {
        hasScatter: false,
        network,
        eosOptions: {
            httpEndpoint: `${network.protocol}://${network.host}:${network.port}`,
            chainId: network.chainId,
        },
        eos: null,
    },
}

const modalReducer = (modalState, action) => {
    switch (action.type) {
        case `MODAL_OPEN`: {
            return {
                ...modalState,
                open: true,
                loading: true,
            }
        }
        case `MODAL_CLOSE`: {
            return {
                ...modalState,
                open: false,
            }
        }
        case `MODAL_LOADING_DONE`: {
            return {
                ...modalState,
                loading: false,
            }
        }
        default:
            return modalState
    }
}

const scatterReducer = (scatterState, action) => {
    switch (action.type) {
        case `SCATTER_LOADED`: {
            const scatter = action.payload
            return {
                ...scatterState,
                hasScatter: true,
                scatter,
                scateos: scatter.eos(
                    scatterState.network,
                    Eos,
                    scatterState.eosOptions,
                    scatterState.network.protocol,
                ),
            }
        }
        default:
            return scatterState
    }
}

export default (state = initialState, action) => {
    switch (action.type) {
        case `FETCH_ROWS_SUCCESS`: {
            const { kingdomOrder, currentKingdomKings, hallOfFameKings } = action.payload
            return {
                ...state,
                currentKingdomOrder: kingdomOrder,
                currentKingdomKings,
                hallOfFameKings,
                // fractal 3 levels deep
                canvasKings: currentKingdomKings.slice(0, 3),
            }
        }
        case `MODAL_OPEN`:
        case `MODAL_CLOSE`:
        case `MODAL_LOADING_DONE`: {
            return {
                ...state,
                modal: modalReducer(state.modal, action),
            }
        }
        case `SCATTER_LOADED`: {
            return {
                ...state,
                scatter: scatterReducer(state.scatter, action),
            }
        }
        default:
            return state
    }
}
