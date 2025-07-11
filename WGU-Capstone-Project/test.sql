
SELECT customer_id, comment_text, created_at
FROM comments
WHERE draft_id = “DRAFT_ID”
ORDER BY created_at DESC;

db.comments.find({“draft_id”: ObjectID(“DRAFT_ID”) })

SELECT geographic_region, COUNT(*) AS draft_count
FROM drafts
WHERE uploaded_date >= NOW() - INTERVAL “24 hours”
GROUP BY geographic_region
ORDER BY draft_count DESC;

db.drafts.aggregate([
  {
    "$match": {
      "uploaded_date": { 
        "$gte": new Date(new Date().getTime() - 24 * 60 * 60 * 1000) 
        }
    }
  },
  {
    "$group": {
      "_id": "$region",
      "draft_count": { "$sum": 1 }
    }
  },
  {
    "$sort": { "total_drafts": -1 }
  }
])

