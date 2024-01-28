#!/bin/bash
# Take provisioned custom model ARN
read -p "Enter the provisioned model ARN (output of the Step Function): " model_arn

# Take the region
read -p "Enter the deployment region: " region

#"arn:aws:bedrock:us-east-1:796495736600:provisioned-model/g11s6thqqtbp" 
# Invoke the model with a sample input and save the output to a file.
aws bedrock-runtime invoke-model \
    --model-id $model_arn\
    --body "{\"prompt\": \"Summarize the following conversation.\\n\\n #Person1#: Hello. My name is John Sandals, and I've got a reservation.\\n #Person2#: May I see some identification, sir, please?\\n #Person1#: Sure. Here you are.\\n #Person2#: Thank you so much. Have you got a credit card, Mr. Sandals?\\n #Person1#: I sure do. How about American Express?\\n #Person2#: Unfortunately, at the present time we take only MasterCard or VISA.\\n #Person1#: No American Express? Okay, here's my VISA.\\n #Person2#: Thank you, sir. You'll be in room 507, nonsmoking, with a queen-size bed. Do you approve, sir?\\n #Person1#: Yeah, that'll be fine.\\n #Person2#: That's great. This is your key, sir. If you need anything at all, anytime, just dial zero.\\n\\n Summary: \"}" custom-model-output.txt \
    --cli-binary-format raw-in-base64-out \
    --region $region
