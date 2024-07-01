document.getElementById('cart-final').addEventListener('submit', async function (event) {
  event.preventDefault(); // 阻止默认表单提交行为

  var newStatus = event.submitter.getAttribute('data-action');
  // 向接口发送请求
  const responseData = await fetch('/orders', {
    method: 'POST',
    body: JSON.stringify({
      newStatus,
      _csrf: event.target.dataset.csrf
    }),
    headers: {
      'Content-Type': 'application/json'
    }
  })
  if(responseData.ok)  window.location.href = responseData.url;
});
