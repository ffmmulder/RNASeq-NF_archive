include RSeQC from '../NextflowModules/RSeQC/3.0.1/RSeQC.nf' params(mem:params.rseqc.mem, singleEnd:params.singleEnd)
include Lc_extrap from '../NextflowModules/Preseq/2.0.3/Lc_extrap.nf' params(mem:params.preseq.mem, optional:params.preseq.toolOptions)

workflow post_mapping_QC {
    get:
      bams_in
      bed_file
    main:
      RSeQC(bams_in, bed_file)
      Lc_extrap(bams_in)
    emit:
      RSeQC.out
      Lc_extrap.out
}
