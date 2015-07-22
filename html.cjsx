React = require 'react'
Typography = require 'typography'
DocumentTitle = require 'react-document-title'

typography = new Typography()
{TypographyStyle} = typography

module.exports = React.createClass
  getDefaultProps: ->
    body: ""

  render: ->
    title = DocumentTitle.rewind()
    if @props.title then title = @props.title

    if __GH_PAGES__? and __GH_PAGES__
      urlPrefix = @props.config.ghPagesURLPrefix
    else
      urlPrefix = ""

    <html lang="en">
      <head>
        <meta charSet="utf-8"/>
        <meta httpEquiv="X-UA-Compatible" content="IE=edge"/>
        <meta name='viewport' content='user-scalable=no width=device-width, initial-scale=1.0 maximum-scale=1.0'/>
        <title>{@props.title}</title>
        <link rel="shortcut icon" href={@props.favicon}/>
        <TypographyStyle/>
        <style dangerouslySetInnerHTML={{__html: """
          body {
            color: rgb(66,66,66);
          }
          h1,h2,h3,h4,h5,h6 {
            color: rgb(44,44,44);
          }
          a {
            color: rgb(42,93,173);
            text-decoration: none;
          }
          a:hover {
            text-decoration: underline;
          }
        """}}/>
      </head>
      <body className="landing-page">
        <div id="react-mount" dangerouslySetInnerHTML={{__html: @props.body}} />
        <script src={urlPrefix + "/bundle.js"}/>
      </body>
    </html>
