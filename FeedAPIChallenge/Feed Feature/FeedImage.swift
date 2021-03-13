//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

public struct FeedImages: Decodable {
	let items: [FeedImage]
	
	enum FeedImagesKeys: String, CodingKey {
		case items
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: FeedImagesKeys.self)
		items = try container.decode([FeedImage].self, forKey: .items)
	}
}

public struct FeedImage: Hashable {
	public let id: UUID
	public let description: String?
	public let location: String?
	public let url: URL
	
	public init(id: UUID, description: String?, location: String?, url: URL) {
		self.id = id
		self.description = description
		self.location = location
		self.url = url
	}
}

extension FeedImage: Decodable {
	
	enum FeedImageKeys: String, CodingKey {
		case id = "image_id"
		case description = "image_desc"
		case location = "image_loc"
		case url = "image_url"
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: FeedImageKeys.self)
		let id = try container.decode(UUID.self, forKey: .id)
		let url = try container.decode(URL.self, forKey: .url)
		let desc = try? container.decode(String.self, forKey: .description)
		let location = try? container.decode(String.self, forKey: .location)
		self.init(id: id, description: desc, location: location, url: url)
	}
}
