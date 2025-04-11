#!/bin/bash

# Title: setup-dev.sh
# Description: Launches both WebSocket and MCP servers in parallel with logs

echo "🚀 Starting WebSocket server (socket.ts)..."
bun run src/socket.ts > logs/socket.log 2>&1 & 
SOCKET_PID=$!

echo "⚙️  Starting MCP server (server.ts)..."
bun run src/talk_to_figma_mcp/server.ts > logs/mcp.log 2>&1 & 
MCP_PID=$!

echo ""
echo "📦 Servers started!"
echo "   - WebSocket PID: $SOCKET_PID (logs: logs/socket.log)"
echo "   - MCP Server PID: $MCP_PID (logs: logs/mcp.log)"
echo ""
echo "📍 Tip: Use 'tail -f logs/*.log' to follow logs in real-time."
echo "🔚 Use 'kill $SOCKET_PID $MCP_PID' to stop both servers manually."
