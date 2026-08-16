import json
from robot.api.deco import keyword


class DataTransformer:

    @keyword("Safely Get Nested Value")
    def safely_get_nested_value(self, dictionary, path, default=None):
        """
        Safely extracts nested dictionary values given a dot-separated path.
        Example: Safely Get Nested Value  ${response_json}  data.metadata.environment
        """
        keys = path.split('.')
        current = dictionary
        for key in keys:
            if isinstance(current, dict) and key in current:
                current = current[key]
            elif isinstance(current, list) and key.isdigit():
                idx = int(key)
                if idx < len(current):
                    current = current[idx]
                else:
                    return default
            else:
                return default
        return current

    @keyword("Serialize To Json String")
    def serialize_to_json_string(self, data_dict):
        """Converts a Python dictionary/list to a formatted JSON string."""
        return json.dumps(data_dict, indent=4)