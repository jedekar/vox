/// Copyright: Copyright (c) 2017-2019 Andrey Penechko.
/// License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
/// Authors: Andrey Penechko.
module fe.ast.expr.call;

import all;

struct CallExprNode {
	mixin ExpressionNodeData!(AstType.expr_call);
	AstIndex callee;
	Array!AstIndex args;
}

void name_resolve_call(CallExprNode* node, ref NameResolveState state) {
	node.state = AstNodeState.name_resolve;
	require_name_resolve(node.callee, state);
	foreach (ref arg; node.args) require_name_resolve(arg, state);
	node.state = AstNodeState.name_resolve_done;
}
