Claude-Code Setup

Steps
 - Install language client: `npm install @anthropic/sdk` or `pip install anthropic`
 - Export key: `export CLAUDE_API_KEY=sk_xxx`
 - Small test script:
   ```js
   import Anthropic from '@anthropic/sdk'
   const c = new Anthropic({apiKey: process.env.CLAUDE_API_KEY})
   // call simple completion to verify
   ```

Verification
 - Run test script. If 401, check CLAUDE_API_KEY value.
