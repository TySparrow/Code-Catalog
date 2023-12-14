let count = 0;

const countHeader = document.getElementById("count")
const countAddBtn = document.getElementById("Add")

countHeader.innerText = count;

countAddBtn.addEventListener("click", () => {
    count++;
    countHeader.innerText = count;

})

const countMinusBtn = document.getElementById("Subtract")

countMinusBtn.addEventListener("click", () => {
    count--;
    countHeader.innerText = count;
})