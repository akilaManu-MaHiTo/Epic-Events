
const card = document.querySelector('#card'),
btnOpenForm = document.querySelector('#btn-open-form'),
form = document.querySelector('#card-form'),
cardNumber = document.querySelector('#card .number'),
cardName = document.querySelector('#card .name'),
brandLogo = document.querySelector('#brand-logo'),
signature = document.querySelector('#card .signature p'),
monthExpDate = document.querySelector('#card .month'),
yearExpDate = document.querySelector('#card .year');
ccv = document.querySelector('#card .ccv');

// * Flip the card to show the front and vice versa.
const flipCard = () => {
	if(card.classList.contains('active')){
		card.classList.remove('active');
	}
}

// * Card rotation
card.addEventListener('click', () => {
	card.classList.toggle('active');
});


// * Button to open the form
btnOpenForm.addEventListener('click', () => {
	btnOpenForm.classList.toggle('active');
	form.classList.toggle('active');
});

// * Select month dinamically.
for(let i = 1; i <= 12; i++){
	let option = document.createElement('option');
	option.value = i;
	option.innerText = i;
	form.selectMonth.appendChild(option);
}

// * Select year dinamically.
const currentYear = new Date().getFullYear();
for(let i = currentYear; i <= currentYear + 8; i++){
	let option = document.createElement('option');
	option.value = i;
	option.innerText = i;
	form.selectYear.appendChild(option);
}


form.inputNumber.addEventListener('keyup', (e) => {
	let inputValue = e.target.value;

	form.inputNumber.value = inputValue
	// Reject Spaces
	.replace(/\s/g, '') 
	// Reject letters
	.replace(/\D/g, '')
	// Place an space each four numbers
	.replace(/([0-9]{4})/g, '$1 ')
	// Delete the last space
	.trim();

	cardNumber.textContent = inputValue;

	if(inputValue == ''){
		cardNumber.textContent = '#### #### #### ####';

		brandLogo.innerHTML = '';
	}

	if(inputValue[0] == 4){
		brandLogo.innerHTML = '';
		const image = document.createElement('img');
		image.src = 'https://raw.githubusercontent.com/falconmasters/formulario-tarjeta-credito-3d/master/img/logos/visa.png';
		brandLogo.appendChild(image);
	} else if(inputValue[0] == 5){
		brandLogo.innerHTML = '';
		const image = document.createElement('img');
		image.src = 'https://raw.githubusercontent.com/falconmasters/formulario-tarjeta-credito-3d/master/img/logos/mastercard.png';
		brandLogo.appendChild(image);
	}

	// Card is flipped to the front to be shown to the user
	flipCard();
});


// * Input Card Holder's Name
form.inputHolder.addEventListener('keyup', (e) => {
	let inputValue = e.target.value;

	form.inputHolder.value = inputValue.replace(/[0-9]/g, '');
	cardName.textContent = inputValue;
	signature.textContent = inputValue;

	if(inputValue == ''){
		cardName.textContent = 'Jhon Doe';
	}

	flipCard();
});

// * Select Month
form.selectMonth.addEventListener('change', (e) => {
	monthExpDate.textContent = e.target.value;
	flipCard();
});

// * Select Year
form.selectYear.addEventListener('change', (e) => {
	yearExpDate.textContent = e.target.value.slice(2);
	flipCard();
});


// * CCV
form.inputCCV.addEventListener('keyup', () => {
	if(!card.classList.contains('active')){
		card.classList.toggle('active');
	}

	form.inputCCV.value = form.inputCCV.value
	// Reject Spaces
	.replace(/\s/g, '')
	// Reject letters
	.replace(/\D/g, '');

	ccv.textContent = form.inputCCV.value;
});