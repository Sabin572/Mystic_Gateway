/**
 * 
 */

function updateStatus(bookingId, newStatus, button) {
      fetch('<%= request.getContextPath() %>/Booking', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'booking_id=' + encodeURIComponent(bookingId) + '&status=' + encodeURIComponent(newStatus),
      })
      .then(response => response.text())
      .then(data => {
        if (data.trim() === 'success') {
          // Update the status cell in the row
          const row = button.closest('tr');
          const statusCell = row.querySelector('td:nth-child(6)');
          statusCell.textContent = newStatus;
        } else {
        }
      })
      .catch(() => {
        alert('Error updating status');
      });
    }