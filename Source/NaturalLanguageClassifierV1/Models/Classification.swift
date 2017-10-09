/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/** A classification generated by the Natural Language Classifier service. */
public struct Classification: JSONDecodable {
    
    /// A unique identifier for the classifier used.
    public let classifierId: String
    
    /// A link to the classifier.
    public let url: String
    
    /// The submitted phrase.
    public let text: String
    
    /// The class with the highest confidence.
    public let topClass: String
    
    /// An array of up to ten class-confidence pairs that are sorted in descending
    /// order of confidence. If there are fewer than 10 classes, the sum of the
    /// confidence values is 100%.
    public let classes: [ClassifiedClass]
    
    /// Used internally to initialize a `Classification` model from JSON.
    public init(json: JSON) throws {
        classifierId = try json.getString(at: "classifier_id")
        url = try json.getString(at: "url")
        text = try json.getString(at: "text")
        topClass = try json.getString(at: "top_class")
        classes = try json.decodedArray(at: "classes", type: ClassifiedClass.self)
    }
}

/** A class-confidence pair generated by the Natural Language Classifier service. */
public struct ClassifiedClass: JSONDecodable {
    
    /// A decimal percentage that represents the confidence Watson has in this class. Higher 
    /// values represent higher confidences.
    public var confidence: Double
    
    /// The class label.
    public var className: String
    
    /// Used internally to initialize a `ClassifiedClass` model from JSON.
    public init(json: JSON) throws {
        confidence = try json.getDouble(at: "confidence")
        className = try json.getString(at: "class_name")
    }
}
