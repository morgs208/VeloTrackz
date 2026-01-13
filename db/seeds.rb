# Clear existing data
puts "Clearing existing data..."
Playlist.destroy_all
Trail.destroy_all
User.destroy_all

# Create test user
puts "Creating test user..."
user = User.create!(
  email_address: "rider@velotrackz.com",
  password: "password123"
)

puts "✓ Created user: #{user.email_address}"

# Create 25 mountain bike trails (simulating OpenStreetMap data)
puts "Creating trails..."

trails_data = [
  { name: "Downieville Downhill", latitude: 39.559564, longitude: -120.826364, description: "Epic 15-mile descent through California gold country", osm_id: "way/123001" },
  { name: "Moab Slickrock", latitude: 38.572961, longitude: -109.582520, description: "Iconic red rock riding in Utah", osm_id: "way/123002" },
  { name: "Whistler A-Line", latitude: 50.059166, longitude: -122.956574, description: "World-class flow trail in BC", osm_id: "way/123003" },
  { name: "Kingdom Trails", latitude: 44.568889, longitude: -72.003056, description: "Vermont's premier trail network", osm_id: "way/123004" },
  { name: "Brevard White Squirrel", latitude: 35.233612, longitude: -82.734375, description: "Pisgah's flowy goodness", osm_id: "way/123005" },
  { name: "Hartland Bike Park", latitude: 45.524722, longitude: -122.587500, description: "Technical New Brunswick riding", osm_id: "way/123006" },
  { name: "Sedona Hangover Trail", latitude: 34.869815, longitude: -111.761107, description: "Exposed desert slickrock", osm_id: "way/123007" },
  { name: "Park City Mid Mountain", latitude: 40.651389, longitude: -111.497778, description: "High-altitude Utah singletrack", osm_id: "way/123008" },
  { name: "Bend Phil's Trail", latitude: 44.058056, longitude: -121.368889, description: "Oregon volcanic soil magic", osm_id: "way/123009" },
  { name: "Oakridge Alpine Trail", latitude: 43.746667, longitude: -122.461111, description: "Pacific Northwest raw descent", osm_id: "way/123010" },
  { name: "Crested Butte 401", latitude: 38.869722, longitude: -106.987500, description: "Colorado high-alpine epic", osm_id: "way/123011" },
  { name: "Fruita 18 Road", latitude: 39.155278, longitude: -108.729167, description: "Desert mesa riding", osm_id: "way/123012" },
  { name: "Tahoe Flume Trail", latitude: 39.195278, longitude: -119.924722, description: "Lake views and exposure", osm_id: "way/123013" },
  { name: "Ashland Lithia Loop", latitude: 42.194722, longitude: -122.709444, description: "Southern Oregon flow", osm_id: "way/123014" },
  { name: "Copper Harbor Flow", latitude: 47.469444, longitude: -87.890278, description: "Michigan's UP gem", osm_id: "way/123015" },
  { name: "Marquette South Trails", latitude: 46.543611, longitude: -87.395556, description: "Lake Superior singletrack", osm_id: "way/123016" },
  { name: "Bentonville Slaughter Pen", latitude: 36.372778, longitude: -94.208889, description: "Arkansas limestone shred", osm_id: "way/123017" },
  { name: "Buffalo Creek", latitude: 39.364167, longitude: -105.276389, description: "Colorado rolling berms", osm_id: "way/123018" },
  { name: "Galbraith Mountain", latitude: 48.766667, longitude: -122.467222, description: "Bellingham's backyard playground", osm_id: "way/123019" },
  { name: "Santos Vortex", latitude: 29.186111, longitude: -82.138889, description: "Florida's fast and flowy", osm_id: "way/123020" },
  { name: "Dupont State Forest", latitude: 35.146944, longitude: -82.612778, description: "NC waterfall country", osm_id: "way/123021" },
  { name: "Tsali Left Loop", latitude: 35.439722, longitude: -83.522222, description: "Smoky Mountain lakeside", osm_id: "way/123022" },
  { name: "Big Bear Skyline", latitude: 34.243889, longitude: -116.911111, description: "SoCal alpine descent", osm_id: "way/123023" },
  { name: "Angelfire Descent", latitude: 36.406111, longitude: -105.285278, description: "New Mexico downhill park", osm_id: "way/123024" },
  { name: "Mount Snow North Peak", latitude: 42.960278, longitude: -72.920833, description: "Vermont bike park classic", osm_id: "way/123025" }
]

trails_data.each do |trail_data|
  Trail.create!(trail_data)
end

puts "✓ Created #{Trail.count} trails"
puts "\n🚀 Seed complete! Login with:"
puts "   Email: rider@velotrackz.com"
puts "   Password: password123"