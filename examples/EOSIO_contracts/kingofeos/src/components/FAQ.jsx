import { Header, Icon, Container, Accordion } from 'semantic-ui-react'

export default class FAQ extends React.PureComponent {
    state = { activeIndex: `readMore` }

    handleClick = (event, titleProps) => {
        const { index } = titleProps
        const { activeIndex } = this.state
        // clicking again closes it
        const newIndex = activeIndex === index ? -1 : index

        this.setState({ activeIndex: newIndex })
    }

    renderAccordion = () => {
        const { activeIndex } = this.state
        return (
            <Container>
                <Accordion fluid styled>
                    <Accordion.Title
                        active={activeIndex === `readMore`}
                        index="readMore"
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        {`I still don't understand how this works. Where can I read more?`}
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `readMore`}>
                        <p>
                            You can read a more in-depth explanation in{` `}
                            <a href="https://cmichel.io/introducing-king-of-eos/">
                                Introducing King of EOS
                            </a>.
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `new_round`}
                        index={`new_round`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        What happens to my EOS after being king for 7 days?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `new_round`}>
                        <p>
                            This is a misconception people have about the workings of this contract.
                            As soon as you become king, your EOS is already sent to the previous
                            king. So there never is any money in the contract to be{` `}
                            <em>given back</em> to you. After 7 days without a new king, a new round
                            starts at{` `}
                            <code>1 EOS</code> again. You will have "lost" your EOS as there's no
                            chance of anybody claiming your throne in the old round, but at least
                            you will be immortalized in the Hall of Fame until the universe and the
                            EOS blockchain die ..
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `becomeKing`}
                        index={`becomeKing`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        How can I become a king?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `becomeKing`}>
                        <p>
                            You need an account on the <a href="https://eos.io">EOS</a> blockchain.
                            Then you need to simply transfer the correct amount of money to the{` `}
                            <strong>kingofeos</strong> contract. (Don{`'`}t worry, if you send a
                            wrong amount the transaction will fail.) This can be done with any
                            wallet. I suggest using{` `}
                            <a href="http://scatter-eos.com/">Scatter</a>, a secure Chrome extension
                            with good integration to websites. Make sure to send your kingdom
                            customizations along as the transfer memo.
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `customize`}
                        index={`customize`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        Can I customize my kingdom?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `customize`}>
                        <p>
                            Yes! A king wouldn{`'`}t be a king without his castle. The castle of the
                            active king is always displayed on top of this page and can be
                            customized: You can set the <strong>name of your kingdom</strong>, and{` `}
                            <strong>upload an image</strong> which will be displayed on the flag of
                            your castle tower.
                        </p>
                        <p>
                            These customizations must be submitted{` `}
                            <strong>
                                along with the transfer claiming the throne in the memo
                            </strong>. Click the <em>Claim</em> button at the top of this page for
                            the correct command.
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `secure`}
                        index={`secure`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        Is this secure? Where is the source code?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `secure`}>
                        <p>
                            {`You can verify that the deployed smart contract matches its source code `}
                            <a
                                target="_blank"
                                rel="noopener noreferrer"
                                href="https://eospark.com/MainNet/contract/eoskingofeos"
                            >
                                on EOSPark
                            </a>. You can also visit{` `}
                            <a
                                target="_blank"
                                rel="noopener noreferrer"
                                href="https://bloks.io/account/eoskingofeos"
                            >
                                bloks.io
                            </a>
                            {` `}
                            to verify the transfers coming in and going out of the contract.
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `commission`}
                        index={`commission`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        How much is the commission charge?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `commission`}>
                        <p>
                            There is a commission charge of 5% per transfer for the development and
                            RAM costs. This means you will still earn 130% of the price{` `}
                            <strong>you paid</strong> when someone claims your throne. (135%
                            increased throne price - 5% commission).
                        </p>
                    </Accordion.Content>

                    <Accordion.Title
                        active={activeIndex === `refund`}
                        index={`refund`}
                        onClick={this.handleClick}
                    >
                        <Icon name="dropdown" />
                        Can I get my money back?
                    </Accordion.Title>
                    <Accordion.Content active={activeIndex === `refund`}>
                        <p>
                            No. The logic is handled by the contract and its transfers cannot be
                            reversed. Be sure to know what you are doing and apply common sense -
                            don't use money you can't afford to lose. Besides that, there never
                            really is any money in the contract itself, because the money that comes
                            in is immediately transfered to the previous king.
                        </p>
                    </Accordion.Content>
                </Accordion>
            </Container>
        )
    }

    render() {
        return (
            <div className="FAQ">
                <Header as="h2" icon textAlign="center">
                    <Icon name="question" />
                    FAQ
                </Header>
                {this.renderAccordion()}
                <style jsx>{`
                    .FAQ {
                        margin-bottom: 50px;
                    }
                `}</style>
            </div>
        )
    }
}
