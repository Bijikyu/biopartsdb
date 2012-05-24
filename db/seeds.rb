# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organism = Organism.create(name: 'yeast', latin: 'Saccharomyces cerevisiae', gbtaxonid: 4932)
feature = Feature.create(so: 'SO:0000167', name: 'promoter', namespace: 'sequence', definition: 'A regulatory_region composed of the TSS(s) and binding sites for TF_complexes of the basal transcription machinery.')
sequence = Sequence.create(data: 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTACCATGTTAATGATCCCCCAGATAAAAAGACAAGACAGAGCATATATCAGACTACATTAACATCTGTACACCCCCAACTGCTTTGAAAAAACCCATGCAGTTATTATTTTCAACAGACCAAGTTTTTTTATCGCTTATCCGGCTCACAGAACGAGCCGTACAACCGTCATCAGACTTGCATGGAAATGTTGAAAAAGAGGTAAAAAAGAAAATATCAAACCCAAACACGCTCGGGCTGAAAAATTAATATGGCAGGAAACGAACTGTAGCCATAATGTACCTGTTCCCGCTAATAGTAATACCATCGTATTGCTAAGGTTAGTAGCTAAAAATCTCTTACTTTCTTTATTTTGACTCTTAGGTCTTACAAGCAATACAAAACCAACACACCTATATATAACTAATA')
location = Location.create(organism: organism, chromosome: 'chr02', start: 60736, stop: 61198, strand: -1 )
part = Part.create(name: 'yeast_promoter_YBL087C', sequence: sequence, feature:feature, location: location)
user = User.create(fullname: 'Giovanni Stracquadanio', provider: 'facebook', email: 'stracquadanio@jhu.edu')
vendor = Vendor.create(name: 'IDT')
oligoPlate = OligoPlate.create(name: 'JHU_PARTS_2012_OLIGO_1', vendor: vendor, user: user)
oligo = Oligo.create(part: part, name: 'yeast_promoter_YBL087C.o01', start: 1, stop: 150, sequence: 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTAC')
well = OligoPlateWell.create(oligo: oligo, oligo_plate: oligoPlate, well: 'A01')


device_type = DeviceType.create(value: "pcr")
device = Device.create(device_type_id: 1, name: "Test PCR Machine")
status1 = Status.create(process: "Spcr", name: "Pending", default: 1 )
status2 = Status.create(process: "Spcr", name: "Finished")
status3 = Status.create(process: "Tpcr", name: "Pending", default: 1 )
status4 = Status.create(process: "Tpcr", name: "Finished")
status5 = Status.create(process: "Fpcr", name: "Pending", default: 1 )
status6 = Status.create(process: "Fpcr", name: "Finished")
qc1 = QualityControl.create(process: "Spcr", name: "PASS")
qc2 = QualityControl.create(process: "Spcr", name: "FAIL")
qc3 = QualityControl.create(process: "Tpcr", name: "PASS")
qc4 = QualityControl.create(process: "Tpcr", name: "FAIL")
qc5 = QualityControl.create(process: "Fpcr", name: "PASS")
qc6 = QualityControl.create(process: "Fpcr", name: "FAIL")