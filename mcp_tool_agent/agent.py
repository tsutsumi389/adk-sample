from google.adk.agents.llm_agent import LlmAgent
from google.adk.tools.mcp_tool.mcp_toolset import MCPToolset, StdioServerParameters
from google.adk.models.lite_llm import LiteLlm

async def create_agent():
  """Gets tools from MCP Server."""
  tools, exit_stack = await MCPToolset.from_server(
      connection_params=StdioServerParameters(
          command='docker',
          args=["run",
            "-i",
            "--rm",
            "mcp/playwright",
          ],
      )
  )

  agent = LlmAgent(
      model=LiteLlm(model="openai/ai/gemma3"),
      name='enterprise_assistant',
      instruction=(
          'WEBページの操作を代行する'
      ),
      tools=tools,
  )
  return agent, exit_stack


root_agent = create_agent()