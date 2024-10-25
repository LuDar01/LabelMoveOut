// Fetch and display existing labels on page load
window.onload = function() {
    fetch('/get-labels')
        .then(response => response.json())
        .then(labels => {
            labels.forEach(label => {
                console.log("label", label);
                // Create a container for each label
                const labelContainer = document.createElement('div');
                labelContainer.className = 'label-box';
                labelContainer.innerHTML = `
                    <p class="tt">${label.description}</p>
                    <canvas id="canvas-${label.id}"></canvas>
                    <p class="">${label.TYPE}</p>
                    <i class="${label.iconClass}"></i><br><button onclick="printLabel(this)">Print Label</button>
                `;
                document.querySelector('.page-box').appendChild(labelContainer);

                QRCode.toCanvas(document.getElementById(`canvas-${label.id}`), 'sample text', { width: 100 }, function(error) {
                    if (error) console.error(error);
                    console.log('QR Code generated successfully!');
                });
            });
        })
        .catch(error => console.error('Error fetching labels:', error));
};

// DOMContentLoaded ensures that the DOM is fully loaded before running the code
document.addEventListener("DOMContentLoaded", function() {
    const createLabelBtn = document.getElementById('createLabelBtn');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const nextBtn = document.getElementById('nextBtn');
    const prevBtn = document.getElementById('prevBtn');
    const createLabelBtnFinal = document.getElementById('createLabelBtnFinal');
    
    // Show the modal and overlay when "Create Label" is clicked
    if (createLabelBtn) {
        createLabelBtn.addEventListener('click', function() {
            resetModal(); // Reset modal state before showing it
            document.getElementById('labelModal').style.display = 'block';
            document.getElementById('modalOverlay').style.display = 'block';  // Show the overlay
        });
    }

    // Close the modal and hide the overlay when "X" is clicked
    if (closeModalBtn) {
        closeModalBtn.addEventListener('click', function() {
            document.getElementById('labelModal').style.display = 'none';
            document.getElementById('modalOverlay').style.display = 'none';  // Hide the overlay
        });
    }

    let currentStep = 1;

    if (nextBtn) {
        nextBtn.addEventListener('click', function() {
            currentStep++;
            showStep(currentStep);
        });
    }

    if (prevBtn) {
        prevBtn.addEventListener('click', function() {
            currentStep--;
            showStep(currentStep);
        });
    }

    if (createLabelBtnFinal) {
        createLabelBtnFinal.addEventListener('click', handleLabelCreation);
    }
});

function showStep(step) {
    if (step === 1) {
        document.querySelector('.label-options').style.display = 'block';
        document.querySelector('.description-input').style.display = 'none';
        document.querySelector('.file-upload').style.display = 'none';
        document.getElementById('nextBtn').style.display = 'block';
        document.getElementById('prevBtn').style.display = 'none';
        document.getElementById('createLabelBtnFinal').style.display = 'none';
    } else if (step === 2) {
        document.querySelector('.label-options').style.display = 'none';
        document.querySelector('.description-input').style.display = 'block';
        document.querySelector('.file-upload').style.display = 'none';
        document.getElementById('nextBtn').style.display = 'block';
        document.getElementById('prevBtn').style.display = 'block';
        document.getElementById('createLabelBtnFinal').style.display = 'none';
    } else if (step === 3) {
        document.querySelector('.label-options').style.display = 'none';
        document.querySelector('.description-input').style.display = 'none';
        document.querySelector('.file-upload').style.display = 'block';
        document.getElementById('nextBtn').style.display = 'none';
        document.getElementById('prevBtn').style.display = 'block';
        document.getElementById('createLabelBtnFinal').style.display = 'block';
    }
}

function resetModal() {
    currentStep = 1;
    showStep(currentStep);
}

function printLabel(button) {
    // Get the label container associated with the clicked button
    const labelContainer = button.closest('.label-box');

    if (!labelContainer) {
        console.error("Label container not found.");
        alert("No label found to print.");
        return;
    }

    // Get the canvas element for the clicked label
    const canvas = labelContainer.querySelector('canvas');
    const imgDataURL = canvas.toDataURL();  // Convert the canvas to a data URL (base64)

    // Create a new window for the print preview
    const printWindow = window.open('', '_blank', 'width=800,height=600');

    // Include the FontAwesome CSS in the print window to ensure icons load
    const fontAwesomeLink = `
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    `;

    // Get the HTML content of the label, including the converted QR code image and the icon
    const labelHTML = `
        <html>
            <head>
                <title>Print Label</title>
                ${fontAwesomeLink} <!-- Ensure FontAwesome is loaded in the print window -->
                <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Add any external styles -->
                <style>
                    /* Optional inline styles for better printing */
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    .label-box { text-align: center; padding: 20px; border: 1px solid #000; }
                    img { margin-top: 10px; }
                    i { font-size: 24px; margin-top: 10px; } /* Ensure icons have appropriate size */
                </style>
            </head>
            <body>
                <div class="label-box">
                    ${labelContainer.querySelector('.tt').outerHTML}  <!-- Label description -->
                    <img src="${imgDataURL}" alt="QR Code"/>  <!-- Use the image data of the clicked label's QR code -->
                    ${labelContainer.querySelector('i').outerHTML}  <!-- Include the icon -->
                </div>
                <script>
                    window.onload = function() {
                        window.print();
                        window.onafterprint = function() { window.close(); };
                    };
                </script>
            </body>
        </html>
    `;

    // Write the content to the new window
    printWindow.document.open();
    printWindow.document.write(labelHTML);
    printWindow.document.close();
}


async function handleLabelCreation() {
    const selectedLabel = document.querySelector('input[name="labelType"]:checked');
    if (!selectedLabel) {
        alert("Please select a label type.");
        return;
    }

    // Get the associated <i> element based on the selected radio button
    const icon = document.querySelector(`label[for="${selectedLabel.id}"] i`);
    const iconClass = icon ? icon.className : ""; // Get the class name or set to an empty string

    const labelType = selectedLabel.value;
    const description = document.getElementById('description').value;
    const fileInput = document.getElementById('fileInput').files[0];
    console.log(iconClass);
    
    const formData = new FormData();
    formData.append('labelType', labelType);
    formData.append('description', description);
    formData.append('iconClass', iconClass); // Now this should have the correct class
    if (fileInput) formData.append('file', fileInput);

    try {
        const response = await fetch('/create-label', {
            method: 'POST',
            body: formData
        });
        const result = await response.json();

        if (result.message === 'Label created') {
            document.getElementById('labelModal').style.display = 'none';

            const labelContainer = document.createElement('div');
            labelContainer.className = 'label-box';
            labelContainer.innerHTML = `
                    <p class="tt">${description}</p>
                    <canvas id="canvas-${result.labelId}"></canvas>
                    <p class="">${labelType}</p>
                    <i class="${iconClass}"></i><br><button onclick="printLabel()">Print Label</button>
                `;
            document.querySelector('.page-box').appendChild(labelContainer);

            QRCode.toCanvas(document.getElementById(`canvas-${result.labelId}`), result.qrCode, { width: 100 }, function(error) {
                if (error) console.error(error);
                console.log('QR Code generated successfully!');
            });            
        } else {
            alert('Error creating label: ' + result.error);
        }
    } catch (error) {
        console.error('Error creating label:', error);
    }
}
