//input_ch = Channel.watchPath( './input/*.avi' )
input_ch = Channel.fromPath( './input/*.avi' )

process convert {
    //errorStrategy "ignore"
    publishDir "output", mode: 'copy'

    container 'jrottenberg/ffmpeg:latest'

    input:
    file input_file from input_ch

    output:
    path "*.mkv"

    """
    ffmpeg -i $input_file ${input_file}.mkv
    """
}
