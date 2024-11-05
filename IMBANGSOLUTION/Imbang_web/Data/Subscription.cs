using System.Collections.Generic;

namespace Imbang_web.Pages.Data
{
    public class Subscription
    {
        //  hold subscriber details
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        // Constructor 
        public Subscription(string firstName, string lastName, string email)
        {
            FirstName = firstName;
            LastName = lastName;
            Email = email;
        }

        // Method to get the formatted subscription information for display
        public string GetSubscriptionInfo()
        {
            return $"First Name: {FirstName}\nLast Name: {LastName}\nEmail: {Email}";
        }
    }

    public class SubscriptionManager
    {
        // store all subscriptions
        private List<Subscription> subscriptions = new List<Subscription>();

        // add a new subscription
        public void AddSubscription(string firstName, string lastName, string email)
        {
            var newSubscription = new Subscription(firstName, lastName, email);
            subscriptions.Add(newSubscription);
        }

        // get all subscriptions
        public List<Subscription> GetSubscriptions()
        {
            return subscriptions;
        }

        // update a subscription at a specific index
        public void EditSubscription(int index, string firstName, string lastName, string email)
        {
            if (index >= 0 && index < subscriptions.Count)
            {
                subscriptions[index].FirstName = firstName;
                subscriptions[index].LastName = lastName;
                subscriptions[index].Email = email;
            }
        }

        //  delete a subscription at a specific index
        public void DeleteSubscription(int index)
        {
            if (index >= 0 && index < subscriptions.Count)
            {
                subscriptions.RemoveAt(index);
            }
        }
    }
}
