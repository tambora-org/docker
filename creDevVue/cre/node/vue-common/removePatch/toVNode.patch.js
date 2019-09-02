
// this function was changed to handle slot content
// hopefully only needed temporary
function toVNode (h, node) {
  if (node.nodeType === 3) {
    return node.data.trim() ? node : null
  } else if (node.nodeType === 1) {
    const slotName = node.getAttribute('slot')
    const data = {
      attrs: getAttributes(node),
      domProps: {
        innerHTML: node.innerHTML
      }
    };
    if (slotName) {
      if (data.attrs.slot) {
        data.slot = data.attrs.slot;
        delete data.attrs.slot;
      }
      return h(node.tagName, data);
    } else {
      return node;
    }
  } else {
    return null
  }
}


