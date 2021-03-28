import { Form, Input, Button, Label, Header, Modal, Message, Icon, Tab } from 'semantic-ui-react'
import PropTypes from 'prop-types'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Dropzone from 'react-dropzone'
import { modalOpen, modalClose, scatterClaim } from '../store/actions'
import { selectCurrentClaimPrice } from '../store/selectors'
import { claimCTAColor } from '../theme'
import { resolveScopedStyles } from '../utils'
import fileUpload, { getImageUrl } from '../utils/fileUpload'
import copyToClipboard from '../utils/copyToClipboard'

const commandStyles = resolveScopedStyles(
    <scope>
        <style jsx>{`
            pre {
                overflow-x: hidden;
                margin: 0 5px 0 0;
                padding: 0 5px;
                background-color: #f0f0f0;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        `}</style>
    </scope>,
)

const commandContainerStyles = resolveScopedStyles(
    <scope>
        <style jsx>{`
            div {
                width: 100%;
            }
        `}</style>
    </scope>,
)

const flagImageStyles = resolveScopedStyles(
    <scope>
        <style jsx>{`
            div {
                color: rgba(191, 191, 191, 0.87);
                border: 1px solid rgba(34, 36, 38, 0.15);
                outline: 0;
                width: 100%;
                height: 67.25px;
                padding: 0.67857143em 1em;
                margin: 0;
            }
        `}</style>
    </scope>,
)

const sanitizeAccountName = accountName => (accountName || ``).replace(/@/g, ``).substring(0, 13)
// TODO: sanitize correctly, this doesn't work when running in a bash
const sanitizeDisplayName = displayName =>
    (displayName || ``).replace(/'/g, `\\'`).replace(/"/g, `\\"`)

const getDefaultState = () => ({
    accountName: ``,
    displayName: ``,
    imageId: ``,
    copyResult: ``,
    formError: ``,
})

class ClaimModal extends React.Component {
    static propTypes = {
        modalOpenAction: PropTypes.func.isRequired,
        modalCloseAction: PropTypes.func.isRequired,
        scatterClaimAction: PropTypes.func.isRequired,
        open: PropTypes.bool.isRequired,
        // eslint-disable-next-line react/no-unused-prop-types
        loading: PropTypes.bool.isRequired,
        hasScatter: PropTypes.bool.isRequired,
        // error coming from Scatter
        // eslint-disable-next-line react/no-unused-prop-types
        error: PropTypes.string.isRequired,
        claimPrice: PropTypes.string.isRequired,
    }

    state = getDefaultState()

    getCleosCommand = () => {
        const { accountName, displayName, imageId } = this.state
        const { claimPrice } = this.props
        const sanitizedAccountName = sanitizeAccountName(accountName)
        const sanitizedDisplayName = sanitizeDisplayName(displayName)
        return `cleos -u https://node1.eosphere.io push action eosio.token transfer '["${sanitizedAccountName}", "eoskingofeos", "${claimPrice} EOS", "${sanitizedDisplayName};${imageId};" ]' -p ${sanitizedAccountName}`
    }

    handleClose = () => {
        this.props.modalCloseAction()
    }

    handleCopyClick = () => {
        copyToClipboard(this.getCleosCommand())
            .then(() =>
                this.setState({
                    copyResult: `positive`,
                }),
            )
            .catch(() =>
                this.setState({
                    copyResult: `negative`,
                }),
            )
    }

    resetErrors = () => {
        this.setState({
            copyResult: ``,
            formError: ``,
        })
    }

    handleAccountNameChange = (event, { value }) => {
        this.setState({
            accountName: value,
        })
        this.resetErrors()
    }

    handleDisplayNameChange = (event, { value }) => {
        this.setState({
            displayName: value.replace(/;/g, ``),
        })
        this.resetErrors()
    }

    handleImageUpload = files => {
        this.resetErrors()
        fileUpload(files[0])
            .then(url => {
                this.setState({
                    imageId: url,
                })
            })
            .catch(err => {
                this.setState({
                    formError: err.message,
                    imageId: ``,
                })
            })
    }

    handleScatterClick = () => {
        const { claimPrice } = this.props
        const { accountName, displayName, imageId } = this.state
        this.props
            .scatterClaimAction({
                accountName: sanitizeAccountName(accountName),
                displayName: sanitizeDisplayName(displayName),
                imageId,
                claimPrice,
            })
            .catch(error => {
                this.setState({
                    formError: error.message,
                })
            })
    }

    handleOpenModalClick = () => {
        this.setState(getDefaultState(), this.props.modalOpenAction)
    }

    renderClaimButton = () => (
        <Button onClick={this.handleOpenModalClick} as="div" size="tiny" labelPosition="right">
            <Button size="tiny" color={claimCTAColor}>
                <Icon name="chess rook" />
                Claim
            </Button>
            <Label as="a" basic color={claimCTAColor} pointing="left">{`${
                this.props.claimPrice
            } EOS`}</Label>
        </Button>
    )

    renderTabs() {
        const { copyResult } = this.state
        const commandLineTab = {
            menuItem: `CLEOS Command Line`,
            render: () => (
                <Tab.Pane as="div">
                    Copy this command to become the current king:
                    <Button
                        className={commandContainerStyles.className}
                        as="div"
                        labelPosition="left"
                        onClick={this.handleCopyClick}
                    >
                        <Label as="pre" className={commandStyles.className} basic pointing="right">
                            {this.getCleosCommand()}
                        </Label>
                        <Button
                            positive={copyResult === `positive`}
                            negative={copyResult === `negative`}
                            icon
                        >
                            <Icon name="copy" />
                        </Button>
                    </Button>
                </Tab.Pane>
            ),
        }
        const scatterTab = {
            menuItem: `Scatter`,
            render: () => (
                <Tab.Pane as="div">
                    {this.props.hasScatter ? (
                        <Button
                            onClick={this.handleScatterClick}
                            as="div"
                            size="tiny"
                            labelPosition="right"
                        >
                            <Button size="tiny" color={claimCTAColor}>
                                <Icon name="chess rook" />
                                Claim
                            </Button>
                            <Label as="a" basic color={claimCTAColor} pointing="left">{`${
                                this.props.claimPrice
                            } EOS`}</Label>
                        </Button>
                    ) : (
                        <span>
                            You need <a href="https://scatter-eos.com">Scatter</a> to claim the
                            throne. Take the demo{` `}
                            <a href="https://www.demos.scatter-eos.com">here</a>.
                        </span>
                    )}
                </Tab.Pane>
            ),
        }
        return [scatterTab, commandLineTab]
    }

    render() {
        const { open } = this.props
        const { accountName, displayName, imageId } = this.state
        return (
            <Modal open={open} onClose={this.handleClose} trigger={this.renderClaimButton()}>
                <Modal.Header>
                    <Header as="h3" icon textAlign="center">
                        <img src="/static/kingofeos.gif" className="icon" />
                        Become King Of EOS!
                    </Header>
                </Modal.Header>
                <Modal.Content>
                    <Modal.Description>
                        <Form>
                            <Form.Field
                                value={accountName}
                                onChange={this.handleAccountNameChange}
                                control={Input}
                                required
                                label="EOS Account"
                                placeholder="@eoskingofeos"
                                maxLength="14"
                            />
                            <Form.Field
                                value={displayName}
                                onChange={this.handleDisplayNameChange}
                                control={Input}
                                required
                                label="Kingdom Name"
                                placeholder="Name or Description of your kingdom"
                                maxLength="100"
                            />
                            <Form.Field>
                                <label>Flag Image (Not animated, no transparency)</label>
                                {imageId ? (
                                    <img
                                        src={getImageUrl(imageId)}
                                        className={flagImageStyles.className}
                                    />
                                ) : (
                                    <Dropzone
                                        className={flagImageStyles.className}
                                        onDrop={this.handleImageUpload}
                                    >
                                        <p>
                                            Drop an image here or click to select one. The size
                                            should be <strong>512x256</strong> or a similar aspect
                                            ratio
                                        </p>
                                    </Dropzone>
                                )}
                            </Form.Field>
                        </Form>
                        <div className="tabContainer">
                            <Tab
                                menu={{ secondary: true, pointing: true }}
                                panes={this.renderTabs()}
                            />
                            {this.state.formError ? (
                                <Message error header="Error" list={[this.state.formError]} />
                            ) : null}
                        </div>
                    </Modal.Description>
                </Modal.Content>
                <style jsx>{`
                    .horizontalFlex {
                        display: flex;
                        align-items: flex-end;
                    }
                    .horizontalFlex:global(> *:first-child) {
                        flex: 1;
                    }
                    .tabContainer {
                        margin-top: 40px;
                    }
                    .command {
                        overflow-x: hidden;
                        margin: 0 5px 0 0;
                        padding: 0 5px;
                        background-color: #f0f0f0;
                    }
                    img {
                        outline: 0;
                        height: 67.25px;
                        padding: 0;
                        margin: 0;
                    }
                `}</style>
                {commandStyles.styles}
                {commandContainerStyles.styles}
                {flagImageStyles.styles}
            </Modal>
        )
    }
}

const mapStateToProps = state => ({
    ...state.modal,
    ...state.scatter,
    claimPrice: selectCurrentClaimPrice(state),
})

const mapDispatchToProps = dispatch => ({
    modalOpenAction: bindActionCreators(modalOpen, dispatch),
    modalCloseAction: bindActionCreators(modalClose, dispatch),
    scatterClaimAction: bindActionCreators(scatterClaim, dispatch),
})

export default connect(
    mapStateToProps,
    mapDispatchToProps,
)(ClaimModal)
