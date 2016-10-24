export default class API {
  constructor(endpoint) {
    this.fetchOpts = {mode: 'no-cors', credentials: 'include'};
    this.endpoint = endpoint;
  }

  commits(username) {
    return fetch(`${this.endpoint}/users/${username}/commits`, this.fetchOpts).then(res => res.json())
  }
};
