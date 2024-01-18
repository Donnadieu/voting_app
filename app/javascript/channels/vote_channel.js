import consumer from "channels/consumer"

consumer.subscriptions.create("VoteChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the vote channel!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the vote channel!");
  },

  received(data) {
    console.log("Received data from the vote channel!");
    console.log(data);
  
    const candidate = document.getElementById(data.candidate_id);

    if (candidate) {
      candidate.innerText = data.vote_count;
    } else {
      const candidates = document.getElementById("candidates");
      const newCandidate = document.createElement("tr");
      newCandidate.innerHTML = `
        <td>${data.candidate_name}</td>
        <td id="${data.candidate_id}">${data.vote_count}</td>
      `;
      candidates.appendChild(newCandidate);
    }
  }
});
