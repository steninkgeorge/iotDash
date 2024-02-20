function createDevice() {
    const newDevice = $('#deviceNameInput').val();
    if (newDevice) {
        // Implement logic to create a new device, e.g., make a REST API call
        // Update the device list in the dropdown
        updateDeviceList();
    }
}
function updateDeviceControls() {
    const selectedDeviceType = $('#deviceTypeSelect').val();
    const deviceControlsContainer = $('#deviceControls');

    // Clear existing controls
    deviceControlsContainer.empty();

    // Dynamically add controls based on the selected device type
    switch (selectedDeviceType) {
        case 'toggle':
            deviceControlsContainer.append('<button class="btn btn-success" onclick="toggleDevice()">Toggle Device</button>');
            break;
        case 'normal':
            deviceControlsContainer.append('<button class="btn btn-primary" onclick="normalButtonAction()">Normal Button</button>');
            break;
        // Add more cases for additional device types
    }
}
function normalButtonAction() {
    // Implement logic for the action performed by the normal button
    // For example, make a REST API call to trigger a specific action
    console.log('Normal button clicked!');
}

function updateDeviceList() {
    // Implement logic to fetch the list of devices, e.g., make a REST API call
    // Dynamically update the options in the device dropdown
    // Sample code to update options (replace with actual implementation)
    const devices = ['Device1', 'Device2', 'Device3'];
    $('#deviceSelect').empty();
    devices.forEach(device => {
        $('#deviceSelect').append(`<option value="${device}">${device}</option>`);
    });
}

function controlDevice() {
    const selectedDevice = $('#deviceSelect').val();
    // Implement logic to display controls or settings for the selected device
}

function toggleDevice() {
    const selectedDevice = $('#deviceSelect').val();
    // Implement logic to toggle the state of the selected device, e.g., make a REST API call
}
