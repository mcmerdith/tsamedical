$('#category').change(function() {
  const selected = $(this).val()
  for (let i = 0; i < 5; i++) {
    const id = `#category-help-${i}`
    if (selected == i) show(id)
    else hide(id);
  }
})
