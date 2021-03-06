desc "Tasks to be executed by Heroku Scheduler"
namespace :schedule do
  desc <<~DESC
    Queues job that marks expired campaigns as archived
    NOTE: Schedule daily
  DESC
  task update_campaign_statuses: :environment do
    UpdateCampaignStatusesJob.perform_later
  end

  desc <<~DESC
    Queues job that creates transactions for daily campaign spend
    NOTE: Schedule daily
  DESC
  task create_debits_for_campaigns: :environment do
    CreateDebitsForCampaignsJob.perform_later
  end

  desc <<~DESC
    Queues job that imports Github Jobs
    NOTE: Schedule daily
  DESC
  task import_github_jobs: :environment do
    tags = ENUMS::KEYWORDS.values.flatten.uniq.sort
    ImportGithubJobsJob.perform_later(*tags)
  end

  desc <<~DESC
    Queues job that ensures daily_summaries have been created for active campaigns and properties
    NOTE: Schedule daily
  DESC
  task daily_summaries: :environment do
    EnsureDailySummariesJob.perform_later
  end

  desc <<~DESC
    Queues job that recalculates all organization balances
    NOTE: Schedule daily
  DESC
  task recalculate_organization_balances: :environment do
    RecalculateOrganizataionBalancesJob.perform_later
  end

  namespace :hubspot do
    desc <<~DESC
      Queues job that updates Hubspot publisher deal stages from: Accepted to Integrated
      NOTE: Schedule daily
    DESC
    task update_publisher_deal_stages_from_accepted_to_integrated: :environment do
      UpdateHubspotPublisherDealStagesFromAcceptedToIntegratedJob.perform_later
    end
  end
end
